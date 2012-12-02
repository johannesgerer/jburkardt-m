function [ relerr, finest, ifail, minpts, wrkstr ] = adapt ( ndim, ...
  a, b, minpts, maxpts, fartulate, rel_tol, itest, alpha, beta, lenwrk, wrkstr )

%*****************************************************************************80
%
%% ADAPT carries out adaptive multidimensional quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 March 2007
%
%  Author:
%
%    Alan Genz
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer NDIM, the number of variables.
%    2 <= NDIM.
%
%    Input, real A(NDIM), the lower limits of integration.
%
%    Input, real B(NDIM), the upper limits of integration.
%
%    Input, integer MINPTS, the minimum number of function evaluations
%    to be allowed,  MINPTS must not exceed MAXPTS.  If MINPTS < 0 then the
%    routine assumes a previous call has been made with the same integrand
%    and continues that calculation.
%
%    Input, integer MAXPTS.  On input, the maximum number of function
%    evaluations allowed, which must be at least RULCLS, where
%    RULCLS = 2**NDIM + 2 * NDIM**2 + 2 * NDIM + 1, when NDIM <= 15 and
%    RULCLS = ( NDIM * ( 14 - NDIM * ( 6 - 4 * NDIM ) ) ) / 3 + 1, 
%    when 15 < NDIM.
%    for NDIM  =  2   3   4   5   6   7   8   9   10   11   12
%    RULCLS   =  17  33  57  93 149 241 401 693 1245 2313 4409
%    A suggested starting value for MAXPTS is 100*RULCLS.  If
%    this is not large enough for the required accuracy, then
%    MAXPTS and LENWRK should be increased accordingly.
%
%    Input, external, real FUNCTN, the user-defined function 
%    to be integrated.  It must have the form
%      function value = functn ( indx, ndim, z, alpha, beta )
%    where
%      INDX is the index of the test function,
%      NDIM is the spatial dimension,
%      Z is the evaluation point,
%      ALPHA is a parameter vector,
%      BETA is a parameter vector.
%
%    Input, real REL_TOL, the user's requested relative accuracy.
%
%    Input, integer ITEST, the index of the test.
%
%    Input, real ALPHA(NDIM), BETA(NDIM), parameters 
%    associated with the integrand function.
%
%    Input, integer LENWRK, the length of the array WRKSTR.
%    The routine needs (2*NDIM+3)*(1+MAXPTS/RULCLS)/2 for LENWRK if
%    MAXPTS function calls are used.
%
%    Workspace, real WRKSTR(LENWRK).  Note that information
%    written into this array during one call may be referred to on a
%    later call.
%
%    Output, real RELERR, the estimated relative accuracy 
%    of the integral estimate.
%
%    Output, real FINEST, the estimated value of integral.
%
%    Output, integer IFAIL
%    * 0, for normal exit, when estimated relative error RELERR is less
%    than REL_TOL, and with MAXPTS or less function calls made.
%    * 1, if MAXPTS was too small for ADAPT to obtain the required relative
%    error REL_TOL.  In this case ADAPT returns a value of FINEST with
%    estimated relative error RELERR.
%    * 2, if LENWRK was too small for MAXPTS function calls.  In
%    this case ADAPT returns a value of FINEST with estimated error
%    RELERR using the working storage available, but RELERR is likely to
%    be greater than REL_TOL.
%    * 3, if NDIM < 2 or MAXPTS < MINPTS or MAXPTS < RULCLS.
%
%    Output, integer MINPTS, the actual number of function 
%    evaluations used.
%
%    Output, real WRKSTR(LENWRK), workspace information that will be
%    needed if another calculation with the same integrand is to be done,
%    (signaled by a followup call with MINPTS < 0).
%
  persistent rgnstr;
  persistent sbrgns;

  ifail = 3;
  relerr = 1.0;
  funcls = 0;

  if ( ndim < 2 )

    minpts = 0;
    wrkstr(lenwrk-1) = sbrgns;

    relerr = 1.0;
    finest = 0.0;
    ifail = 3;

    return
  end

  if ( maxpts < minpts )

    minpts = 0;
    wrkstr(lenwrk-1) = sbrgns;

    relerr = 1.0;
    finest = 0.0;
    ifail = 3;

    return
  end

  if ( ndim <= 15 )
    rulcls = 2^ndim + 2 * ndim * ndim + 2 * ndim + 1;
  elseif ( 15 < ndim )
    rulcls = 1 + ( ndim * ( 12 + ( ndim - 1 ) ...
      * ( 6 + ( ndim - 2 ) * 4 ) ) ) / 3;
  end

  if ( maxpts < rulcls )

    relerr = 1.0;
    finest = 0.0;
    ifail = 3;

    return
  end
%
%  Initialization.
%
  rgnstr = 2 * ndim + 3;
  divaxo = 0;
%
%  Basic rule initialization.
%
  lambda5 = 9.0 / 19.0;

  if ( ndim <= 15 )

    lambda4 = 9.0 / 10.0;
    lambda2 = 9.0 / 70.0;
    weit5 = 1.0 / ( 3.0 * lambda5 )^3 / 2.0^ndim;

  else

    ratio = ( ndim - 2 ) / 9.0;

    lambda4 = ( 1.0 / 5.0 - ratio ) / ( 1.0 / 3.0 - ratio / lambda5 );

    ratio = ( 1.0 - lambda4 / lambda5 ) * ( ndim - 1 ) * ratio / 6.0;

    lambda2 = ( 1.0 / 7.0 - lambda4 / 5.0 - ratio ) ...
      / ( 1.0 / 5.0 - lambda4 / 3.0 - ratio / lambda5 );

    weit5 = 1.0 / ( 6.0 * lambda5 )^3;

  end

  weit4 = ( 1.0 / 15.0 - lambda5 / 9.0 ) ...
    / ( 4.0 * ( lambda4 - lambda5 ) * lambda4^2 );

  weit3 = ( 1.0 / 7.0 - ( lambda5 + lambda2 ) / 5.0 ...
    + lambda5 * lambda2 / 3.0 ) / ( 2.0 * lambda4 ...
    * ( lambda4 - lambda5 ) * ( lambda4 - lambda2 ) ) ...
    - 2.0 * ( ndim - 1 ) * weit4;

  weit2 = ( 1.0 / 7.0 - ( lambda5 + lambda4 ) / 5.0 ...
    + lambda5 * lambda4 / 3.0 ) / ( 2.0 * lambda2 ...
    * ( lambda2 - lambda5 ) * ( lambda2 - lambda4 ) );

  if ( ndim <= 15 )
    weit1 = 1.0 - 2.0 * ndim * ( weit2 + weit3 + ( ndim - 1 ) * weit4 ) ...
      - 2.0^ndim * weit5;
  else
    weit1 = 1.0 - 2 * ndim * ( weit2 + weit3 + ( ndim - 1 ) * ...
        ( weit4 + 2 * ( ndim - 2 ) * weit5 / 3.0 ) );
  end

  weitp4 = 1.0 / ( 6.0 * lambda4 )^2;

  weitp3 = ( 1.0 / 5.0 - lambda2 / 3.0 ) / ...
    ( 2.0 * lambda4 * ( lambda4 - lambda2 ) ) ...
    - 2.0 * ( ndim - 1 ) * weitp4;

  weitp2 = ( 1.0 / 5.0 - lambda4 / 3.0 ) ...
    / ( 2.0 * lambda2 * ( lambda2 - lambda4 ) );

  weitp1 = 1.0 - 2.0 * ndim * ( weitp2 + weitp3 + ( ndim - 1 ) * weitp4 );

  ratio = lambda2 / lambda4;

  lambda5 = sqrt ( lambda5 );
  lambda4 = sqrt ( lambda4 );
  lambda2 = sqrt ( lambda2 );
%
%  End basic rule initialization.
%
  if ( minpts < 0 )

    sbrgns = wrkstr(lenwrk-1);
    divflg = 0;
    subrgn = rgnstr;
    wrkstr(lenwrk) = wrkstr(lenwrk) - wrkstr(subrgn);
    finest = finest - wrkstr(subrgn-1);
    divaxo = wrkstr(subrgn-2);

    for j = 1 : ndim
      subtmp = subrgn - 2 * ( j + 1 );
      center(j) = wrkstr(subtmp+1);
      width(j) = wrkstr(subtmp);
    end

    width(divaxo) = width(divaxo) / 2.0;
    center(divaxo) = center(divaxo) - width(divaxo);

  else

    width(1:ndim) = ( b(1:ndim) - a(1:ndim) ) / 2.0;
    center(1:ndim) = a(1:ndim) + width(1:ndim);

    finest = 0.0;
    wrkstr(lenwrk) = 0.0;
    divflg = 1;
    subrgn = rgnstr;
    sbrgns = rgnstr;

  end
%
%  Begin basic rule.
%
  while ( 1 )

    rgnvol = 2.0^ndim * prod ( width(1:ndim) );

    z(1:ndim) = center(1:ndim);

    sum1 = functn ( itest, ndim, z, alpha, beta );
%
%  Compute symmetric sums of functn(lambda2,0,0,...,0) and
%  functn(lambda4,0,0,...,0), and maximum fourth difference.
%
    difmax = -1.0;
    sum2 = 0.0;
    sum3 = 0.0;

    for j = 1 : ndim

      z(j) = center(j) - lambda2 * width(j);
      f1 = functn ( itest, ndim, z, alpha, beta );
      z(j) = center(j) + lambda2 * width(j);
      f2 = functn ( itest, ndim, z, alpha, beta );
      widthl(j) = lambda4 * width(j);
      z(j) = center(j) - widthl(j);
      f3 = functn ( itest, ndim, z, alpha, beta );
      z(j) = center(j) + widthl(j);
      f4 = functn ( itest, ndim, z, alpha, beta );
      sum2 = sum2 + f1 + f2;
      sum3 = sum3 + f3 + f4;
      df1 = f1 + f2 - 2.0 * sum1;
      df2 = f3 + f4 - 2.0 * sum1;
      dif = abs ( df1 - ratio * df2 );

      if ( difmax < dif )
        difmax = dif;
        divaxn = j;
      end

      z(j) = center(j);

    end

    if ( sum1 == sum1 + difmax / 8.0 );
      divaxn = mod ( divaxo, ndim ) + 1;
    end
%
%  Compute symmetric sum of functn(lambda4,lambda4,0,0,...,0).
%
    sum4 = 0.0;

    for j = 2 : ndim

      for k = j : ndim
  
        for l = 1 : 2

          widthl(j-1) = -widthl(j-1);
          z(j-1) = center(j-1) + widthl(j-1);

          for m = 1 : 2
            widthl(k) = -widthl(k);
            z(k) = center(k) + widthl(k);
            sum4 = sum4 + functn ( itest, ndim, z, alpha, beta );
          end

        end

        z(k) = center(k);

      end

      z(j-1) = center(j-1);

    end
%
%  If NDIM < 16 compute symmetric sum of functn(lambda5,lambda5,...,lambda5).
%
    if ( ndim <= 15 )

      sum5 = 0.0;

      widthl(1:ndim) = -lambda5 * width(1:ndim);
      z(1:ndim) = center(1:ndim) + widthl(1:ndim);

      while ( 1 )

        sum5 = sum5 + functn ( itest, ndim, z, alpha, beta );

        j = ndim;

        while ( 1 )

          widthl(j) = - widthl(j);
          z(j) = center(j) + widthl(j);

          if ( 0.0 <= widthl(j) )
            break
          end

          j = j - 1;

          if ( j < 1 )
            break
          end

        end

        if ( j < 1 )
          break
        end

      end
%
%  If 15 < NDIM, compute symmetric sum of
%  FUNCTN(lambda5,lambda5,lambda5,0,0,...,0).
%
    else

      sum5 = 0.0;

      widthl(1:ndim) = lambda5 * width(1:ndim);

      for i = 3 : ndim
        for j = i : ndim
          for k = j : ndim

            for l = 1 : 2
              widthl(i-2) = -widthl(i-2);
              z(i-2) = center(i-2) + widthl(i-2);
              for m = 1 : 2
                widthl(j-1) = -widthl(j-1);
                z(j-1) = center(j-1) + widthl(j-1);
                for n = 1 : 2
                  widthl(k) = -widthl(k);
                  z(k) = center(k) + widthl(k);
                  sum5 = sum5 + functn ( itest, ndim, z, alpha, beta );
                end
              end
            end

            z(k) = center(k);

          end

          z(j-1) = center(j-1);

        end

        z(i-2) = center(i-2);

      end

    end
%
%  Compute fifth and seventh degree rules and error.
%
    rgncmp = rgnvol * ( weitp1 * sum1 ...
                      + weitp2 * sum2 ...
                      + weitp3 * sum3 ...
                      + weitp4 * sum4 );
 
    rgnval = rgnvol * ( weit1 * sum1 ...
                      + weit2 * sum2 ...
                      + weit3 * sum3 ...
                      + weit4 * sum4 ...
                      + weit5 * sum5 );

    rgnerr = abs ( rgnval - rgncmp );
%
%  End basic rule.
%
    finest = finest + rgnval;
    wrkstr(lenwrk) = wrkstr(lenwrk) + rgnerr;
    funcls = funcls + rulcls;
%
%  Place results of basic rule into partially ordered list
%  according to subregion error.
%
%  When DIVFLG = 0, start at the top of the list and move down the 
%  list tree to find the correct position for the results from the
%  first half of the recently divided subregion.
%
    if ( divflg ~= 1 )

      while ( 1 )

        subtmp = 2 * subrgn;

        if ( sbrgns < subtmp )
          break
        end

        if ( subtmp ~= sbrgns )
          sbtmpp = subtmp + rgnstr;
          if ( wrkstr(subtmp) < wrkstr(sbtmpp) )
            subtmp = sbtmpp;
          end
        end

        if ( wrkstr(subtmp) <= rgnerr )
          break
        end

        for k = 1 : rgnstr
          wrkstr(subrgn-k+1) = wrkstr(subtmp-k+1);
        end

        subrgn = subtmp;

      end
%
%  When DIVFLG = 1 start at bottom right branch and move up list
%  tree to find correct position for results from second half of
%  recently divided subregion.
%
    else

      while ( 1 )

        subtmp = floor ( subrgn / ( 2 * rgnstr ) ) * rgnstr;

        if ( subtmp < rgnstr )
          break
        end

        if ( rgnerr <= wrkstr(subtmp) )
          break
        end

        for k = 1 : rgnstr
          index1 = subrgn - k + 1;
          index2 = subtmp - k + 1;
          wrkstr(index1) = wrkstr(index2);
        end

        subrgn = subtmp;

      end

    end
%
%  Store results of basic rule in correct position in list.
%
    wrkstr(subrgn) = rgnerr;
    wrkstr(subrgn-1) = rgnval;
    wrkstr(subrgn-2) = divaxn;

    for j = 1 : ndim
      subtmp = subrgn - 2 * ( j + 1 );
      wrkstr(subtmp+1) = center(j);
      wrkstr(subtmp) = width(j);
    end
%
%  When DIVFLG = 0 prepare for second application of basic rule.
%
    if ( divflg ~= 1 )
      center(divaxo) = center(divaxo) + 2.0 * width(divaxo);
      sbrgns = sbrgns + rgnstr;
      subrgn = sbrgns;
      divflg = 1;
      continue
    end
%
%  End ordering and storage of basic rule results.
%  Make checks for possible termination of routine.
%
    relerr = 1.0;

    if ( wrkstr(lenwrk) <= 0.0 )
      wrkstr(lenwrk) = 0.0;
    end

    if ( abs ( finest ) ~= 0.0 )
      relerr = wrkstr(lenwrk) / abs ( finest );
    end

    if ( 1.0 < relerr )
      relerr = 1.0;
    end

    if ( lenwrk < sbrgns + rgnstr + 2 )
      ifail = 2;
    end

    if ( maxpts < funcls + 2 * rulcls )
      ifail = 1;
    end

    if ( relerr < rel_tol & minpts <= funcls )
      ifail = 0;
    end

    if ( ifail < 3 )
      minpts = funcls;
      wrkstr(lenwrk-1) = sbrgns;
      break
    end
%
%  Prepare to use basic rule on each half of subregion with largest
%  error.
%
    divflg = 0;
    subrgn = rgnstr;
    wrkstr(lenwrk) = wrkstr(lenwrk) - wrkstr(subrgn);
    finest = finest - wrkstr(subrgn-1);
    divaxo = wrkstr(subrgn-2);

    for j = 1 : ndim
      subtmp = subrgn - 2 * ( j + 1 );
      center(j) = wrkstr(subtmp+1);
      width(j) = wrkstr(subtmp);
    end

    width(divaxo) = width(divaxo) / 2.0;
    center(divaxo) = center(divaxo) - width(divaxo);

  end

  return
end
