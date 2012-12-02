function f = p07_f ( m, n, x )

%*****************************************************************************80
%
%% P07_F evaluates the objective function for problem 07.
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
  y = r8vec_indicator ( m );
  y(1:m,1) = sqrt ( y(1:m,1) );

  for j = 1 : n
    f(j) = sum ( x(1:m,j).^2 ) / 4000.0 ...
      - prod ( cos ( x(1:m,j) ./ y(1:m) ) ) + 1.0;
  end

  return
end
