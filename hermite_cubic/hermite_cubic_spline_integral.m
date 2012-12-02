function q = hermite_cubic_spline_integral ( nn, xn, fn, dn )

%*****************************************************************************80
%
%% HERMITE_CUBIC_SPLINE_INTEGRAL: Hermite cubic spline integral.
%
%  Discussion:
%
%    The integral is taken over the definition interval [X(1),X(NN)].
%
%    Note that if the intervals are equal in size, then the derivative
%    information in DN has no effect on the integral value,
%    except for the first and last entries.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2011
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
%    Output, real Q, the integral of the Hermite cubic spline
%    over the interval X(1) <= X <= X(NN).
%

%
%  Guarantee that we have column vectors.
%
  xn = xn ( : );
  fn = fn ( : );
  dn = dn ( : );
%
%  Index the left and right values for each interval.
%
  il = 1 : nn - 1;
  ir = 2 : nn;

  h = xn(ir) - xn(il);

  q = sum ( ...
    0.5 * h .* ( fn(il) + fn(ir) + h .* ( dn(il) - dn(ir) ) / 6.0 ) );

  return
end
