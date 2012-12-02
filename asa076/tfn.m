function value = tfn ( x, fx )

%*****************************************************************************80
%
%% TFN calculates the T-function of Owen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by JC Young, Christoph Minder.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    MA Porter, DJ Winstanley,
%    Remark AS R30:
%    A Remark on Algorithm AS76:
%    An Integral Useful in Calculating Noncentral T and Bivariate
%    Normal Probabilities,
%    Applied Statistics,
%    Volume 28, Number 1, 1979, page 113.
%
%    JC Young, Christoph Minder,
%    Algorithm AS 76:
%    An Algorithm Useful in Calculating Non-Central T and
%    Bivariate Normal Distributions,
%    Applied Statistics,
%    Volume 23, Number 3, 1974, pages 455-457.
%
%  Parameters:
%
%    Input, real X, FX, the parameters of the function.
%
%    Output, real VALUE, the value of the T-function.
%
  ng = 5;

  r = [ ...
    0.1477621, ...
    0.1346334, ...
    0.1095432, ...
    0.0747257, ...
    0.0333357 ];
  tp = 0.159155;
  tv1 = 1.0E-35;
  tv2 = 15.0;
  tv3 = 15.0;
  tv4 = 1.0E-05;
  u = [ ...
    0.0744372, ...
    0.2166977, ...
    0.3397048, ...
    0.4325317, ...
    0.4869533 ];
%
%  Test for X near zero.
%
  if ( abs ( x ) < tv1 )
    value = tp * atan ( fx );
    return
  end
%
%  Test for large values of abs(X).
%
  if ( tv2 < abs ( x ) )
    value = 0.0;
    return
  end
%
%  Test for FX near zero.
%
  if ( abs ( fx ) < tv1 )
    value = 0.0;
    return
  end
%
%  Test whether abs ( FX ) is so large that it must be truncated.
%
  xs = - 0.5 * x * x;
  x2 = fx;
  fxs = fx * fx;
%
%  Computation of truncation point by Newton iteration.
%
  if ( tv3 <= log ( 1.0 + fxs ) - xs * fxs )

    x1 = 0.5 * fx;
    fxs = 0.25 * fxs;

    while ( 1 )

      rt = fxs + 1.0;

      x2 = x1 + ( xs * fxs + tv3 - log ( rt ) ) ...
        / ( 2.0 * x1 * ( 1.0 / rt - xs ) );

      fxs = x2 * x2;

      if ( abs ( x2 - x1 ) < tv4 )
        break
      end

      x1 = x2;

    end

  end
%
%  Gaussian quadrature.
%
  rt = 0.0;

  for i = 1 : ng

    r1 = 1.0 + fxs * ( 0.5 + u(i) )^2;
    r2 = 1.0 + fxs * ( 0.5 - u(i) )^2;

    rt = rt + r(i) * ( exp ( xs * r1 ) / r1 + exp ( xs * r2 ) / r2 );

  end

  value = rt * x2 * tp;

  return
end
