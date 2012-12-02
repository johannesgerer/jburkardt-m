function f = goldstein_price_xy ( x, y )

%*****************************************************************************80
%
%% GOLDSTEIN_PRICE_XY evaluates the Goldstein-Price polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
%  Parameters:
%
%    Input, real X, Y, the arguments of the function.
%
%    Output, real F, the value of the function at X.
%
  a = x + y + 1.0;

  b = 19.0 - 14.0 * x + 3.0 * x * x - 14.0 * y ...
    + 6.0 * x * y + 3.0 * y * y;

  c = 2.0 * x - 3.0 * y;

  d = 18.0 - 32.0 * x + 12.0 * x * x + 48.0 * y ...
    - 36.0 * x * y + 27.0 * y * y;

  f = ( 1.0 + a * a * b ) * ( 30.0 + c * c * d );

  return
end
