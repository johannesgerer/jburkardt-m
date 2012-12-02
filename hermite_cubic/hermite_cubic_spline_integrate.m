function q = hermite_cubic_spline_integrate ( nn, xn, fn, dn, n, a, b )

%*****************************************************************************80
%
%% HERMITE_CUBIC_SPLINE_INTEGRATE integrates a Hermite cubic spline over [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2011
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%  Parameters:
%
%    Input, integer NN, the number of data points.
%
%    Input, real XN(NN), the coordinates of the data points.
%    The entries in XN must be in strictly ascending order.
%
%    Input, real FN(NN), the function values.
%
%    Input, real DN(NN), the derivative values.
%
%    Input, integer N, the number of integration intervals.
%
%    Input, real A(N), B(N), the integration endpoints.
%
%    Output, real Q(N), the integral over the interval [A,B].
%
  q = zeros ( n, 1 );
%
%  Force data to be column vectors.
%
  left = floor ( nn + 1 ) / 2;

  for ii = 1 : n

    if ( a(ii) <= b(ii) )
      aa = a(ii);
      bb = b(ii);
      s = + 1.0;
    else
      aa = b(ii);
      bb = a(ii);
      s = - 1.0;
    end

    i = r8vec_bracket3 ( nn, xn, aa, left );
    j = r8vec_bracket3 ( nn, xn, bb, left );
%
%  Evaluate the polynomial with the appropriate data.
%
    if ( i == j )

      q(ii) = hermite_cubic_integrate ( xn(i), fn(i), dn(i), ...
        xn(i+1), fn(i+1), dn(i+1), aa, bb );

    else

      q(ii) = hermite_cubic_integrate ( xn(i), fn(i), dn(i), ...
        xn(i+1), fn(i+1), dn(i+1), aa, xn(i+1) );
      for k = i + 1 : j - 1
        q(ii) = q(ii) + hermite_cubic_integral ( xn(k), fn(k), dn(k), ...
          xn(k+1), fn(k+1), dn(k+1) );
      end
      q(ii) = q(ii) + hermite_cubic_integrate ( xn(j), fn(j), dn(j), ...
        xn(j+1), fn(j+1), dn(j+1), xn(j), bb );

    end

    q(ii) = s * q(ii);

  end

  return
end

