function h = p43_h ( n, x )

%*****************************************************************************80
%
%% P43_H evaluates the Hessian for problem 43.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
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
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  h(1,1) = 8.0 * x(1) * x(1) ...
         + 4.0 * ( x(1) * x(1) + x(2) - 11.0 ) ...
         + 2.0;

  h(1,2) = 4.0 * x(1) + 4.0 * x(2);

  h(2,1) = 4.0 * x(1) + 4.0 * x(2);

  h(2,2) = 2.0 ...
         + 8.0 * x(2) * x(2) ...
         + 4.0 * ( x(1) + x(2) * x(2) - 7.0 );

  return
end
