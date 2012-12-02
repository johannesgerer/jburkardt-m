function g = p13_g ( n, x )

%*****************************************************************************80
%
%% P13_G evaluates the gradient for problem 13.
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
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  s1 = sum ( cos ( x(1:n) ) );

  s2 = 0.0;
  for j = 1 : n
    t =  ( n + j ) - sin ( x(j) ) - s1 - j * cos ( x(j) );
    s2 = s2 + t;
    g(j) = ( j * sin ( x(j) ) - cos ( x(j) ) ) * t;
  end

  for j = 1 : n
    g(j) = 2.0 * ( g(j) + sin ( x(j) ) * s2 );
  end

  return
end
