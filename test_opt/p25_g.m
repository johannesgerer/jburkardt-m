function g = p25_g ( n, x )

%*****************************************************************************80
%
%% P25_G evaluates the gradient for problem 25.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for i = 1 : n
    g(i) = i * 4.0 * x(i)^3;
  end

  return
end
