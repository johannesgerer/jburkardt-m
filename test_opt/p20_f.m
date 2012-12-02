function f = p20_f ( n, x )

%*****************************************************************************80
%
%% P20_F evaluates the objective function for problem 20.
%
%  Discussion:
%
%    The function has the form
%      f = x'*A*x - 2*x(1)
%    where A is the (-1,2,-1) tridiagonal matrix, except that A(1,1) is 1.
%    The minimum value of F(X) is -N, which occurs for
%      x = ( n, n-1, ..., 2, 1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Prentice Hall, 1973,
%    Reprinted by Dover, 2002.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = x(1) * x(1) + 2.0 * sum ( x(2:n).^2 );

  for i = 1 : n - 1
    f = f - 2.0 * x(i) * x(i+1);
  end

  f = f - 2.0 * x(1);

  return
end
