function f = goldstein_price ( m, x )

%*****************************************************************************80
%
%% GOLDSTEIN_PRICE evaluates the Goldstein-Price polynomial.
%
%  Discussion:
%
%    The minimizer is
%
%      X* = [ 0.0, -1.0 ]
%      F(X*) = 3.0
%
%    Suggested starting point:
%
%      X = [ -0.5, 0.25 ] (easy convergence)
%      X = [ -4.0, 5.00 ] (harder convergence)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
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
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  a = x(1) + x(2) + 1.0;

  b = 19.0 - 14.0 * x(1) + 3.0 * x(1) * x(1) - 14.0 * x(2) ...
    + 6.0 * x(1) * x(2) + 3.0 * x(2) * x(2);

  c = 2.0 * x(1) - 3.0 * x(2);

  d = 18.0 - 32.0 * x(1) + 12.0 * x(1) * x(1) + 48.0 * x(2) ...
    - 36.0 * x(1) * x(2) + 27.0 * x(2) * x(2);

  f = ( 1.0 + a * a * b ) * ( 30.0 + c * c * d );

  return
end
