function f = p40_f ( n, x )

%*****************************************************************************80
%
%% P40_F evaluates the objective function for problem 40.
%
%  Discussion:
%
%    There is a typo in the reference.  I'm just guessing at the correction.
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
  f = x(1)^2 + 2.0 * x(2)^2 ...
    - 0.3 * cos ( 3.0 * pi * x(1) ) ...
    + cos ( 4.0 * pi * x(2) ) + 0.3;

  return
end
