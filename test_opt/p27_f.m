function f = p27_f ( n, x )

%*****************************************************************************80
%
%% P27_F evaluates the objective function for problem 27.
%
%  Discussion:
%
%    F can be regarded as a function of R = SQRT ( X(1)^2 + X(2)^2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2001
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
  r = sqrt ( x(1)^2 + x(2)^2 );

  a = ( 1.0 + 0.001 * r^2 )^( -2 );

  b = ( sin ( r ) )^2 - 0.5;

  f = 0.5 + a * b;

  return
end
