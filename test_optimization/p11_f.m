function f = p11_f ( m, n, x )

%*****************************************************************************80
%
%% P11_F evaluates the objective function for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2012
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

  for j = 1 : n

    rsq = sum ( x(1:m,j).^2 );

    f(j) = - ( 1.0 + cos ( 12.0 * sqrt ( rsq ) ) ) / ( 0.5 * rsq + 2.0 );

  end

  return
end
