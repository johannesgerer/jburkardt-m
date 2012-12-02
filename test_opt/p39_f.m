function f = p39_f ( n, x )

%*****************************************************************************80
%
%% P39_F evaluates the objective function for problem 39.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2001
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
  f = x(1) * x(1) + 2.0 * x(2) * x(2) ...
    - 0.3 * cos ( 3.0 * pi * x(1) ) ...
    * cos ( 4.0 * pi * x(2) ) + 0.3;

  return
end
