function f = p29_f ( n, x )

%*****************************************************************************80
%
%% P29_F evaluates the objective function for problem 29.
%
%  Discussion:
%
%    Note that F is a polynomial in X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2001
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
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
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
