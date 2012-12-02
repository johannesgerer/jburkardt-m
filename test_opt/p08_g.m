function g = p08_g ( n, x )

%*****************************************************************************80
%
%% P08_G evaluates the gradient for problem 8.
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
  ap = 0.00001;

  t1 = - 0.25 + sum ( x(1:n).^2 );

  g(1:n,1) = 2.0 * ap * ( x(1:n,1) - 1.0 ) + 4.0 * x(1:n,1) * t1;

  return
end
