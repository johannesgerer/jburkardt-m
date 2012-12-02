function f = p37_f ( n, x )

%*****************************************************************************80
%
%% P37_F evaluates the objective function for problem 37.
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
  arg = - ( x(1) - pi )^2 - ( x(2) - pi )^2;
  f = - cos ( x(1) ) * cos ( x(2) ) * exp ( arg );

  return
end
