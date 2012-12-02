function w = hermite_cubic_spline_quad_rule ( nn, xn )

%*****************************************************************************80
%
%% HERMITE_CUBIC_SPLINE_QUAD_RULE: Hermite cubic spline quadrature rule.
%
%  Discussion:
%
%    The integral is taken over the definition interval [X(1),X(NN)].
%
%    Note that if the intervals are equal in size, then the derivative
%    information in DN has no effect on the integral value,
%    except for the first and last entries.
%
%    The quadrature rule is
%
%      Integral ( XN(1) <= X <= XN(NN) ) F(X) dX is approximately
%
%      Sum ( 1 <= I <= NN ) W(1,I) * F(X(I)) + W(2,I) * F'(X(I))
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2011
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
%    Output, real W(2,NN), the quadrature weights for F(1:NN)
%    and DN(1:NN).
%
  w = zeros ( 2, nn );

  w(1,1)      = 0.5 * ( xn(1,2)    - xn(1,1)      );
  w(1,2:nn-1) = 0.5 * ( xn(1,3:nn) - xn(1,1:nn-2) );
  w(1,nn)     = 0.5 * ( xn(1,nn)   - xn(1,nn-1)   );

  w(2,1)      =   ( xn(1,2) - xn(1,1) ).^2 / 12.0;
  w(2,2:nn-1) =   ( xn(1,3:nn) - xn(1,1:nn-2) ) ...
                .* ( xn(1,3:nn) - 2.0 * xn(1,2:nn-1) + xn(1,1:nn-2) ) / 12.0;
  w(2,nn)     = - ( xn(1,nn-1) - xn(1,nn) ).^2 / 12.0;

  return
end
