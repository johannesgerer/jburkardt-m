function f = p10_f ( m, n, x )

%*****************************************************************************80
%
%% P10_F evaluates the objective function for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
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

  p = 10;

  y = r8vec_indicator ( m );

  for j = 1 : n
    f(j) = - sum ( ...
      sin ( x(1:m,j) ) .* ( sin ( x(1:m,j).^2 .* y(1:m) / pi ) ).^( 2 * p ) ...
    );
  end

  return
end
