function f = p30_f ( n, x )

%*****************************************************************************80
%
%% P30_F evaluates the objective function for problem 30.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2001
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
  a = 1.0;
  d = 6.0;
  e = 10.0;

  b = 5.1 / ( 4.0 * pi^2 );
  c = 5.0 / pi;
  ff = 1.0 / ( 8.0 * pi );

  f = a * ( x(2) - b * x(1)^2 + c * x(1) - d )^2 ...
    + e * ( 1.0 - ff ) * cos ( x(1) ) + e;

  return
end
