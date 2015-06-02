function multst ( nsamp, tstlim, tstfns, tstmax, difclt, expnts, ndiml, ...
  ndims, sbname, subrtn, rel_tol, maxpts )

%*****************************************************************************80
%
%% MULTST tests a multidimensional integration routine.
%
%  Discussion:
%
%    The routine uses the Genz test integrand functions, with
%    the user selecting the particular subset of test integrands,
%    the set of difficulty factors, and the spatial dimensions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2007
%
%  Author:
%
%    Alan Genz
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration:
%    Recent Developments, Software and Applications,
%    edited by Patrick Keast, Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer NSAMP, the number of samples.
%    1 <= NSAMP.
%
%    Input, integer TSTLIM, the number of test integrands.
%
%    Input, integer TSTFNS(TSTLIM), the indices of the test integrands.
%    Each index is between 1 and 6.
%
%    Input, integer TSTMAX, the number of difficulty levels to be tried.
%
%    Input, real DIFCLT(TSTMAX), difficulty levels.
%
%    Input, real EXPNTS(TSTMAX), the difficulty exponents.
%
%    Input, integer NDIML, the number of sets of variable sizes.
%
%    Input, integer NDIMS(NDIML), the number of variables for the integrals
%    in each test.
%
%    Input, string SBNAME, the name of the integration 
%    subroutine to be tested.
%
%    Input, external SUBRTN, the integration subroutine to be tested.
%
%    Input, real REL_TOL, the relative error tolerance.
%
%    Input, integer MAXPTS, the maximum number of integrand calls
%    for all tests on input.  
%
  mxtsfn = 6;
%
%  Initialize and compute confidence coefficient.
%
  concof = 0.0;
  nconf = max ( 1, floor ( 2 * nsamp ) / 5 - 2 );

  for i = 1 : nconf
    concof = 1.0 + ( nsamp - nconf + i ) * concof / ( nconf - i + 1 );
  end

  concof = 1.0 - concof / 2^( nsamp - 1 );

  seed = 123456;

  small = eps;

  idfclt(1:tstlim) = difclt(tstfns(1:tstlim));
  expons(1:tstlim) = expnts(tstfns(1:tstlim));
%
%  Begin main loop for different numbers of variables.
%
  for ndimv = 1 : ndiml

    ndim = ndims(ndimv);

    if ( ndim <= 15 )
      rulcls = 2^ndim + 2 * ndim^2 + 2 * ndim + 1;
    else
      rulcls = floor ( ( ndim * ( 14 - ndim * ( 6 - 4 * ndim ) ) ) / 3 + 1 );
    end

    lenwrk = floor ( ( 2 * ndim + 3 ) * ( 1 + maxpts / rulcls ) / 2 );
    wrkstr = zeros ( 1, lenwrk );

    if ( mod ( ndimv - 1, 6 ) == 0 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Test results with %d samples per test\n', nsamp );
      fprintf ( 1, '\n' );

      fprintf ( 1, '  Difficulty levels' );
      for i = 1 : tstlim
        fprintf ( 1, '%6d', idfclt(i) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '          Exponents' );
      for i = 1 : tstlim
        fprintf ( 1, '%6.1f', expons(i) );
      end
      fprintf ( 1, '\n' );

      digits = floor ( - log10 ( rel_tol ) ); 

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Requested digits = %d, Maximum values = %d\n', ...
        digits, maxpts );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  %s tests, variable results with confidence %f\n', ...
        sbname, concof );
      fprintf ( 1, '\n' );
      fprintf ( 1, ' Vari-  Integrand     Correct digits   Relia-  Wrong' );
      fprintf ( 1, '   Integrand   Quality Total\n' );
      fprintf ( 1, ' ables              Estimated   Actual bility Digits' );
      fprintf ( 1, '    Values             Fails\n' );
      fprintf ( 1, '\n' );

    end
%
%  Begin loop for different test integrands.
%
    for it = 1 : tstlim

      itest = tstfns(it);
      exn = expnts(itest);
      dfclt = difclt(itest);

      a(1:ndim) = 0.0;
      b(1:ndim) = 1.0;

      ifails = 0;
      medrel = 0;
%
%  Begin loop for different samples.
%
      for k = 1 : nsamp

        ifail = 1;
%
%  Choose the integrand function parameters at random.
%
        for n = 1 : ndim
          [ alpha(n), seed ] = genz_random ( seed );
          [ beta(n), seed ] = genz_random ( seed );
        end
%
%  Modify ALPHA to account for difficulty parameter.
%
        total = sum ( alpha(1:ndim) );
        dfact = total * ndim^exn / dfclt;
        alpha(1:ndim) = alpha(1:ndim) / dfact;
%
%  For tests 1 and 3, we modify the value of B.
%
        if ( itest == 1 | itest == 3 )
          b(1:ndim) = alpha(1:ndim);
        end
%
%  For test 6, we modify the value of BETA.
%
        if ( itest == 6 )
          beta(3:ndim) = 1.0;
        end
%
%  Get the exact value of the integral.
%
        value = genz_integral ( itest, ndim, a, b, alpha, beta );
%
%  Call the integration subroutine.
%
        minpts = 4 * 2^ndim;

%       [ errest, finest, ifail, minpts, wrkstr ] = subrtn ( ndim, ...
%         a, b, minpts, maxpts, @genz_function, rel_tol, itest, alpha, beta, ...
%         lenwrk, wrkstr );
      
        [ errest, finest, ifail, minpts, wrkstr ] = adapt ( ndim, ...
          a, b, minpts, maxpts, @genz_function, rel_tol, itest, alpha, beta, ...
          lenwrk, wrkstr );

        relerr = abs ( ( finest - value ) / value );
        ifails = ifails + min ( ifail, 1 );
        relerr = max ( min ( 1.0, relerr ), small );
        errlog = max ( 0.0, -log10 ( relerr ) );
        errest = max ( min ( 1.0, errest ), small );
        estlog = max ( 0.0, -log10 ( errest ) );
        meddsc(k) = max ( 0.0, estlog - errlog );
        medest(k) = estlog;
        medact(k) = errlog;
        medcls(k) = minpts;

        if ( relerr <= errest )
          medrel = medrel + 1;
        end

      end
%
%  End loop for different samples and compute medians.
%
      medest_med = r8vec_median ( nsamp, medest );
      medact_med = r8vec_median ( nsamp, medact );
      medcls_med = r8vec_median ( nsamp, medcls );
      meddsc_med = r8vec_median ( nsamp, meddsc );

      medrel = medrel / nsamp;

      trelib(it) = medrel;

      tactrs(it) = medact_med(2);
      testrs(it) = medest_med(2);
      terdsc(it) = meddsc_med(2);
      tcalsa(it) = medcls_med(2);

      tcalsb(it) = medcls_med(3);
      tactrb(it) = medact_med(3);
      testrb(it) = medest_med(3);
      terdsb(it) = meddsc_med(3);

      ersrel(itest,ndimv) = medrel;

      ersest(itest,ndimv) = medest_med(2);
      ersact(itest,ndimv) = medact_med(2);
      ersdsc(itest,ndimv) = meddsc_med(2);

      ersesb(itest,ndimv) = medest_med(3);
      ersacb(itest,ndimv) = medact_med(3);
      ersdsb(itest,ndimv) = meddsc_med(3);

      callsa(itest,ndimv) = medcls_med(2);

      callsb(itest,ndimv) = medcls_med(3);

      qality = 0.0;

      if ( medcls_med(1) ~= 0.0 )
        qality = ( medact_med(1) + 1.0 ) * ...
          ( medest_med(1) + 1.0 - meddsc_med(1) ) / log ( medcls_med(1) );
      end

      tqualt(it) = qality;
      qualty(itest,ndimv) = qality;
      rcalsa = medcls_med(2);
      rcalsb = medcls_med(3);
      name = genz_name ( itest );

      fprintf ( 1, '%4d  %s%4.1f%5.1f%5.1f%5.1f%5.2f%4.1f%4.1f%7d%8d%6.2f%5d\n', ...
        ndim, name, medest_med(2), medest_med(3), medact_med(2), ...
        medact_med(3), medrel, meddsc_med(2), meddsc_med(3), rcalsa, rcalsb, ...
        qality, ifails );

    end
%
%  End loop for different test integrands.
%
    tactrs_med = r8vec_median ( tstlim, tactrs );
    trelib_med = r8vec_median ( tstlim, trelib );
    testrs_med = r8vec_median ( tstlim, testrs );
    terdsc_med = r8vec_median ( tstlim, terdsc );
    tactrb_med = r8vec_median ( tstlim, tactrb );
    testrb_med = r8vec_median ( tstlim, testrb );
    terdsb_med = r8vec_median ( tstlim, terdsb );
    tqualt_med = r8vec_median ( tstlim, tqualt );
    tcalsa_med = r8vec_median ( tstlim, tcalsa );
    tcalsb_med = r8vec_median ( tstlim, tcalsb );

    rcalsa = tcalsa_med(1);
    rcalsb = tcalsb_med(1);

    fprintf ( 1, '%4d  %s%4.1f%5.1f%5.1f%5.1f%5.2f%4.1f%4.1f%7d%8d%6.2f\n', ...
      ndim, 'Medians       ', testrs_med(1), testrb_med(1), tactrs_med(1), ...
      tactrb_med(1), trelib_med(1), terdsc_med(1), terdsb_med(1), rcalsa, ...
      rcalsb, tqualt_med(1) );

    fprintf ( 1, '\n' );

  end
%
%  End loop for different numbers of variables.
%
  if ( 1 < ndiml )

    fprintf ( 1, '\n' );
    fprintf ( 1, '      %s Test integrand medians for variables', sbname );
    for i = 1 : ndiml
      fprintf ( 1, '%3d', ndims(i) );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '        Integrand     Correct digits   Relia-  Wrong' );
    fprintf ( 1, '   Integrand   Quality\n' );
    fprintf ( 1, '                    Estimated   Actual bility digits' );
    fprintf ( 1, '     Values\n' );
    fprintf ( 1, '\n' );

    for it = 1 : tstlim

      itest = tstfns(it);

      medact(1:ndiml) = ersact(itest,1:ndiml);
      medest(1:ndiml) = ersest(itest,1:ndiml);
      meddsc(1:ndiml) = ersdsc(itest,1:ndiml);
      medacb(1:ndiml) = ersacb(itest,1:ndiml);
      medesb(1:ndiml) = ersesb(itest,1:ndiml);
      meddsb(1:ndiml) = ersdsb(itest,1:ndiml);
      medrll(1:ndiml) = ersrel(itest,1:ndiml);
      qallty(1:ndiml) = qualty(itest,1:ndiml);
      medcla(1:ndiml) = callsa(itest,1:ndiml);
      medclb(1:ndiml) = callsb(itest,1:ndiml);

      medrll_med = r8vec_median ( ndiml, medrll );
      medact_med = r8vec_median ( ndiml, medact );
      medest_med = r8vec_median ( ndiml, medest );
      meddsc_med = r8vec_median ( ndiml, meddsc );
      medacb_med = r8vec_median ( ndiml, medacb );
      medesb_med = r8vec_median ( ndiml, medesb );
      meddsb_med = r8vec_median ( ndiml, meddsb );
      qallty_med = r8vec_median ( ndiml, qallty );
      medcla_med = r8vec_median ( ndiml, medcla );
      medclb_med = r8vec_median ( ndiml, medclb );

      rcalsa = medcla_med(1);
      rcalsb = medclb_med(1);
      name = genz_name ( itest )

      fprintf ( 1, '      %s%4.1f%5.1f%5.1f%5.1f%5.2f%4.1f%4.1f%7d%8d%6.2f\n', ...
        name, medest_med(1), medesb_med(1), medact_med(1), ...
        medacb_med(1), medrll_med(1), meddsc_med(1), meddsb_med(1), ...
        rcalsa, rcalsb, qallty_med(1) );

      tactrs(it) = medact_med(1);
      testrs(it) = medest_med(1);
      terdsc(it) = meddsc_med(1);
      tactrb(it) = medacb_med(1);
      testrb(it) = medesb_med(1);
      terdsb(it) = meddsb_med(1);
      tcalsa(it) = medcla_med(1);
      tcalsb(it) = medclb_med(1);
      trelib(it) = medrll_med(1);
      tqualt(it) = qallty_med(1);

    end

    tactrs_med = r8vec_median ( tstlim, tactrs );
    testrs_med = r8vec_median ( tstlim, testrs );
    terdsc_med = r8vec_median ( tstlim, terdsc );
    tactrb_med = r8vec_median ( tstlim, tactrb );
    testrb_med = r8vec_median ( tstlim, testrb );
    terdsb_med = r8vec_median ( tstlim, terdsb );
    trelib_med = r8vec_median ( tstlim, trelib );
    tqualt_med = r8vec_median ( tstlim, tqualt );
    tcalsa_med = r8vec_median ( tstlim, tcalsa );
    tcalsb_med = r8vec_median ( tstlim, tcalsb );

    rcalsa = tcalsa_med(1);
    rcalsb = tcalsb_med(1);

    fprintf ( 1, '      %s%4.1f%5.1f%5.1f%5.1f%5.2f%4.1f%4.1f%7d%8d%6.2f\n', ...
      'Global medians', testrs_med(1), testrb_med(1), tactrs_med(1), ...
      tactrb_med(1), trelib_med(1), terdsc_med(1), terdsb_med(1), rcalsa, ...
      rcalsb, tqualt_med(1) );

    fprintf ( 1, '\n' );

  end

  return
end
