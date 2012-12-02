function f = p35_f ( n, x )

%*****************************************************************************80
%
%% P35_F evaluates the objective function for problem 35.
%
%  Discussion:
%
%    For -10 <= X(I) <= 10, the function has 760 local minima, 18 of which
%    are global minima, with minimum value -186.73.
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
  factor1 = 0.0;
  for i = 1 : 5
    y = i;
    factor1 = factor1 + y * cos ( ( y + 1.0 ) * x(1) + y );
  end

  factor2 = 0.0;
  for i = 1 : 5
    y = i;
    factor2 = factor2 + y * cos ( ( y + 1.0 ) * x(2) + y );
  end

  f = factor1 * factor2;

  return
end
