function f = p21_f ( n, x )

%*****************************************************************************80
%
%% P21_F evaluates the objective function for problem 21.
%
%  Discussion:
%
%    The function has the form
%      f = x'*A*x
%    where A is the Hilbert matrix.  The minimum value
%    of F(X) is 0, which occurs for
%      x = ( 0, 0, ..., 0 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = 0.0;

  for i = 1 : n
    for j = 1 : n
      f = f + x(i) * x(j) / ( i + j - 1 );
    end
  end

  return
end
