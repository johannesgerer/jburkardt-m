function jac = p12_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P12_JAC evaluates the jacobian for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  nbco = 1;
  nbcz = 1;
  nint = 8;
  maxpolys = 6;

  dbcodt(1) = 0.0;
  dbczdt(1) = 0.0;

  if ( option == 1 )
    npolys = 2;
    nderiv = 1;
  elseif ( option == 2 )
    npolys = 4;
    nderiv = 1;
  elseif ( option == 3 )
    npolys = 4;
    nderiv = 2;
  elseif ( option == 4 )
    npolys = 6;
    nderiv = 1;
  elseif ( option == 5 )
    npolys = 6;
    nderiv = 2;
  elseif ( option == 6 )
    npolys = 6;
    nderiv = 3;
  end

  nvary = nint * npolys;
%
%  Get the Gauss quadrature rule.
%
  [ gcoef, gpoint ] = p12_gauss8 ( );
%
%  1.  Set up the terms from the bivariate form A * Y:
%
  for i = 1 : nint

    iskip = ( i - 1 ) * npolys;
    xl = ( i - 1 ) / nint;
    xr = i / nint;
    dtdx = 2.0 / ( xr - xl );
%
%  For each Gauss point in the interval:
%
    for j = 1 : 8

      t = gpoint(j);
      coef = gcoef(j) * ( xr - xl ) / 2.0;
      [ pl, pld ] = p12_legendre_val ( t, dtdx, npolys );

      u = 0.0;
      uprym = 0.0;
      for k = 1 : npolys
        u = u + x(iskip+k) * pl(k);
        uprym = uprym + x(iskip+k) * pld(k);
      end

      phipu = 0.0;
      phipup = - 1.0;
      phipt = 0.0;

      psipu = x(nvar) * ( 1.0 + u * ( 2.0 + 3.0 * u ) ) ...
        * cos ( u * ( 1.0 + u * ( 1.0 + u ) ) );
      psipup = 0.0;
      psipt = sin ( u * ( 1.0 + u * ( 1.0 + u ) ) );
%
%  For each Legendre polynomial coefficient:
%
      for l = 1 : npolys

        ieqn = iskip + l;
        jac(ieqn,nvar) = jac(ieqn,nvar) ...
          + coef * ( psipt * pl(l) + phipt * pld(l) );
%
%  For each Y-coefficient of U:
%
        for n = 1: npolys
          ivar = npolys * ( i - 1 ) + n;
          jac(ieqn,ivar) = jac(ieqn,ivar) + coef * ( ...
                ( psipu * pl(n) + psipup * pld(n) ) * pl(l) ...
              + ( phipu * pl(n) + phipup * pld(n) ) * pld(l) );

        end

      end

    end

  end
%
%  2. Add the terms involving the continuity of the test functions
%  which are the terms B * Z in F = A * Y + B * Z.
%
  for i = 1 : nint

    if ( i == 1 )
      ncl = nvary;
    else
      ncl = nvary + nbcz + ( i - 2 ) * nderiv;
    end

    ncr = nvary + nbcz + ( i - 1 ) * nderiv;
    xl = ( i - 1 ) / nint;
    xr = i / nint;
    dtdx = 2.0 / ( xr - xl );
%
%  For the polynomials used in approximating each U,
%  count conditions at left endpoint, LHIL, and at right, LHIR.
%
      if ( i == 1 )
        lhil = nbcz;
      else
        lhil = nderiv;
      end

      if ( i == nint )
        lhir = nbco;
      else
        lhir = nderiv;
      end
%
%  For each test function PL(K).
%
      for k = 1 : npolys
        s = r8_mop ( k + 1 );
        ieqn = ( i - 1 ) * npolys + k;
%
%  Consider the conditions:
%
        h2i = 1.0;
        for l = 1 : lhil
          s = - s;
          ivar = ncl + l;
          jac(ieqn,ivar) = s * h2i * p12_theta ( l, k );
          h2i = h2i * dtdx;
        end
%
%  Evaluate contribution from right endpoint.
%
        h2i = 1.0;
        for l = 1 : lhir
          ivar = ncr + l;
          jac(ieqn,ivar) = h2i * p12_theta ( l, k );
          h2i = h2i * dtdx;
        end
      end

    end
%
%  3. Create the terms for the U functions and their derivatives
%  the matrix terms C * Y.
%
  for i = 1 : nint

    if ( i == 1 )
      ncl = nvary;
    else
      ncl = nvary + nbcz + ( i - 2 ) * nderiv;
    end

    ncr = nvary + nbcz + ( i - 1 ) * nderiv;
    npsum = ( i - 1 ) * npolys;
    xl = ( i - 1 ) / nint;
    xr = i / nint;
    dtdx = 2.0 / ( xr - xl );

    h2i = 1.0;
%
%  Count the conditions:
%
    if ( i == 1 )
      khil = nbcz;
    else
      khil = nderiv;
    end
%
%  Left hand term:
%
    for k = 1 : khil

     ieqn = ncl + k;

      if ( i == 1 )
        jac(ieqn,nvar) = dbczdt(k);
      end

      s = r8_mop ( k + 1 );
      for l = 1 : npolys
        ivar = npsum + l;
        s = - s;
        jac(ieqn,ivar) = s * h2i * p12_theta ( k, l );
      end
      h2i = h2i * dtdx;
    end

    ncl = ncl + khil;
%
%  Right hand term:
%
    h2i = 1.0;

    if ( i == nint )
      khir = nbco;
    else
      khir = nderiv;
    end

    for k = 1 : khir

      ieqn = ncr + k;

      if ( i == nint )
        jac(ieqn,nvar) = - dbcodt(k);
      else
        jac(ieqn,nvar) = 0.0;
      end

      for l = 1 : npolys
        ivar = npsum + l;
        jac(ieqn,ivar) = h2i * p12_theta ( k, l );
      end

      h2i = h2i * dtdx;

    end

    ncr = ncr + khir;
    npsum = npsum + npolys;

  end

  return
end
