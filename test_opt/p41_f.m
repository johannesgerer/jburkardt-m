function f = p41_f ( n, x )

%*****************************************************************************80
%
%% P41_F evaluates the objective function for problem 41.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2001
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
  f = 100.0 * ( x(2) - x(1)^2 )^2 ...
    + ( 1.0 - x(1) )^2 ...
    + 90.0 * ( x(4) - x(3)^2 )^2 ...
    + ( 1.0 - x(3) )^2 ...
    + 10.1 * ( ( x(2) - 1.0 )^2 + ( x(4) - 1.0 )^2 ) ...
    + 19.8 * ( x(2) - 1.0 ) * ( x(4) - 1.0 );

  return
end
