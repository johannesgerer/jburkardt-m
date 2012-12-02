function [ f, d, s, t ] = hermite_cubic_spline_value ( nn, xn, fn, dn, n, x )

%*****************************************************************************80
%
%% HERMITE_CUBIC_SPLINE_VALUE evaluates a Hermite cubic spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2011
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
%    Input, integer N, the number of sample points.
%
%    Input, real X(N), the coordinates of the sample points.
%
%    Output, real F(N), the function value at the sample points.
%
%    Output, real D(N), the derivative value at the sample points.
%
%    Output, real S(N), the second derivative value at the sample points.
%
%    Output, real T(N), the third derivative value at the sample points.
%

%
%  Force data to be column vectors.
%
  xn = xn ( : );
  fn = fn ( : );
  dn = dn ( : );

  x = x ( : );
%
%  Insert "guard" values of -Inf and +Inf.
%
  xn2 = [ -Inf; xn(1:nn); +Inf ];
%
%  HISTC returns in I1 the index in XN2 such that
%  XN2(I1(I)) <= X(I) <= XN2(I1(I)+1).
%
  [ n1, i1 ] = histc ( x, xn2 );
%
%  Assign anything in the (-Inf,XN(1)) bin to (XN(1),XN(2)).
%
  k = find ( i1 == 1 );
  i1(k) = 2;
%
%  Assign anything in the (XN(NN),+Inf) bin to (XN(NN-1),XN(NN)).
%
  k = find ( i1 == nn + 1 );
  i1(k) = nn;
%
%  Now shift the indices down by 1 because -Inf is fictitious.
%
  i1 = i1 - 1;
%
%  Index the right hand endpoint.
%
  i2 = i1 + 1;
%
%  Evaluate the polynomial with the appropriate data.
%
  [ f, d, s, t ] = hermite_cubic_value ( xn(i1), fn(i1), dn(i1), ...
                                         xn(i2), fn(i2), dn(i2), n, x );

  return
end

