function f = p33_f ( n, x )

%*****************************************************************************80
%
%% P33_F evaluates the objective function for problem 33.
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
  m = 10;
  a = [ ...
       4.0, 4.0, 4.0, 4.0; ...
       1.0, 1.0, 1.0, 1.0; ...
       8.0, 8.0, 8.0, 8.0; ...
       6.0, 6.0, 6.0, 6.0; ...
       3.0, 7.0, 3.0, 7.0; ...
       2.0, 9.0, 2.0, 9.0; ...
       5.0, 5.0, 3.0, 3.0; ...
       8.0, 1.0, 8.0, 1.0; ...
       6.0, 2.0, 6.0, 2.0; ...
       7.0, 3.6, 7.0, 3.6 ]';

  c = [ 0.1, 0.2, 0.2, 0.4, 0.6, 0.6, 0.3, 0.7, 0.5, 0.5 ]';

  f = 0.0;
  for j = 1 : m
    f = f - 1.0 / ( c(j) + sum ( ( x(1:n) - a(1:n,j) ).^2 ) );
  end

  return
end
