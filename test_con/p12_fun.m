function fx = p12_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P12_FUN evaluates the function for problem 12.
%
%  Title:
%
%    Materially nonlinear problem.
%
%  Description:
%
%    The problem is the two point boundary value problem
%
%      U'' + LAMBDA * SIN ( U + U**2 + U**3 ) = 0
%
%    with boundary conditions
%
%      U(0) = 0.0
%      U(1) = 0.0
%
%    U is approximated by piecewise polynomials whose coefficients are
%    the unknowns U(1), ..., U(NVAR-1), and the value of LAMBDA is
%    stored as U(NVAR).
%
%  Options:
%
%    OPTION  Polynomials   Continuity
%      1     linear         1
%      2     cubic          1
%      3     cubic          2
%      4     quintic        1
%      5     quintic        2
%      6     quintic        3
%
%    All options use 8 intervals.
%
%  Comments:
%
%    The current program has zero as solution for all X(nvar).
%    Must find bifurcation branch and jump on to it.
%    Perhaps add X(nvar+1) a perturbation to right hand side.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ivo Babuska, Werner Rheinboldt,
%    Reliable Error Estimations and Mesh Adaptation for the Finite
%    Element Method,
%    in International Conference on Computational Methods
%    in Nonlinear Mechanics,
%    edited by John Oden,
%    Elsevier, 1980,
%    ISBN: 0444853820,
%    LC: QA808.I57.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%
  nbco = 1;
  nbcz = 1;
  nint = 8;
  maxpolys = 6;

  bcone(1) = 0.0;
  bczero(1) = 0.0;

  fx(1:nvar-1) = 0.0;

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
    npolys = 6;;
    nderiv = 3;
  end

  nvary = nint * npolys;
%
%  Get the Gauss quadrature rule.
%
  [ gcoef, gpoint ] = p12_gauss8 ( );
%
%  Set up the terms A * Y involving the bivariate form
%
%  For each interval I:
%
  for i = 1 : nint

    iskip = ( i - 1 ) * npolys;
    xl = ( i - 1 ) / nint;
    xr = i / nint;
    dtdx = 2.0 / ( xr - xl );
%
%  For each Gauss point, J, evaluate the integrand.
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

      phi = - uprym;
      psi = x(nvar) * sin ( u * ( 1.0 + u * ( 1.0 + u ) ) );
      lskip = iskip;
%
%  Project onto each test function L.
%
      for l = 1 : npolys
        ieqn = lskip + l;
        fx(ieqn) = fx(ieqn) + coef * ( psi * pl(l) + phi * pld(l) );
      end

      lskip = lskip + npolys;

    end

  end
%
%  2. Add the terms B * Z for the continuity of the test functions.
%
%  For each interval I:
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
%  Count conditions at the left endpoint, LHIL, and at right, LHIR.
%  If we are in the first or last interval, one of
%  these will be boundary conditions.
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
%  For each test function PL(K):
%
    for k = 1 : npolys

      s = r8_mop ( k + 1 );
      ieqn = ( i - 1 ) * npolys + k;
%
%  Apply the boundary conditions.
%
      h2i = 1.0;
      for l = 1 : lhil
        s = - s;
        ivar = ncl + l;
        fx(ieqn) = fx(ieqn) + s * x(ivar) * h2i * p12_theta ( l, k );
        h2i = h2i * dtdx;
      end

      h2i = 1.0;
      for l = 1 : lhir
        ivar = ncr + l;
        fx(ieqn) = fx(ieqn) + x(ivar) * h2i * p12_theta ( l, k );
        h2i = h2i * dtdx;
      end

    end

  end
%
%  3. Create the C * Y terms for U and its derivatives.
%  One equation is generated for component and condition.
%
  npsum = 0;
  dtdxr = 0.0;
  dtdxl = 0.0;
%
%  For each node:
%
  ndsum = nvary;

  for i = 1 : nint + 1

    if ( 1 < i )
      xl = ( i - 2 ) / nint;
    end

    xc = ( i - 1 ) / nint;

    if ( i < nint + 1 )
      xr = i / ( nint );
    end

    if ( xc ~= xl )
      dtdxl = 2.0 / ( xc - xl );
    end

    if ( xr ~= xc )
      dtdxr = 2.0 / ( xr - xc );
    end

    h2il = 1.0;
    h2ir = 1.0;
%
%  Count the conditions:
%
    if ( i == 1 )
      khi = nbcz;
    elseif ( i < nint + 1 )
      khi = nderiv;
    elseif ( i == nint + 1 )
      khi = nbco;
    end

    for k = 1 : khi

      s = r8_mop ( k + 1 );
%
%  Set up the term from the left hand interval.
%
      ieqn = ndsum + k;

      if ( i == 1 )

        fx(ieqn) = fx(ieqn) + bczero(k);

      else

        for l = 1 : npolys
          ivar = npsum + l - npolys;
          fx(ieqn) = fx(ieqn) + x(ivar) * h2il * p12_theta ( k, l );
        end

      end
%
%  Set up the term from the right hand interval.
%
      if ( i == nint + 1 )

        fx(ieqn) = fx(ieqn) - bcone(k);

      else

        for l = 1 : npolys
          ivar = npsum + l;
          s = - s;
          fx(ieqn) = fx(ieqn) + s * x(ivar) * h2ir * p12_theta(k,l);
        end
      end

      h2il = h2il * dtdxl;
      h2ir = h2ir * dtdxr;

    end

    ndsum = ndsum + khi;
    npsum = npsum + npolys;

  end

  return
end
