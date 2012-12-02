function f = p28_f ( n, x )

%*****************************************************************************80
%
%% P28_F evaluates the objective function for problem 28.
%
%  Discussion:
%
%    Note that F is a function of R^2 = X(1)^2 + X(2)^2
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
  r = sqrt ( x(1)^2 + x(2)^2 );

  f = sqrt ( r ) * ( 1.0 + ( sin ( 50.0 * r^0.2 ) )^2 );

  return
end
