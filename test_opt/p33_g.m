function g = p33_g ( n, x )

%*****************************************************************************80
%
%% P33_G evaluates the gradient for problem 33.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2001
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

  for k = 1 : n
    for j = 1 : m
      d = c(j) + sum ( ( x(1:n) - a(1:n,j) ).^2 );
      g(k) = g(k) + ( 2.0 * ( x(k) - a(k,j) ) ) / d^2;
    end
  end

  return
end
