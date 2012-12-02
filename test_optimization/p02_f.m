function f = p02_f ( m, n, x )

%*****************************************************************************80
%
%% P02_F evaluates the objective function for problem 02.
%
%  Discussion:
%
%    This function is also known as the weighted sphere model.
%
%    The function is continuous, convex, and unimodal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%
  f = zeros ( n, 1 );

  y = r8vec_indicator ( m );

  for j = 1 : n
    f(j) = sum ( y(1:m) .* x(1:m,j).^2 );
  end

  return
end
