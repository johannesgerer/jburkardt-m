function h = p39_h ( n, x )

%*****************************************************************************80
%
%% P39_H evaluates the Hessian for problem 39.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2001
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

  h(1,1) = 2.0 + 2.7 * pi^2 * cos ( 3.0 * pi * x(1) ) ...
    * cos ( 4.0 * pi * x(2) );

  h(1,2) = - 3.6 * pi^2 * sin ( 3.0 * pi * x(1) ) ...
    * sin ( 4.0 * pi * x(2) );

  h(2,1) = - 3.6 * pi^2 * sin ( 3.0 * pi * x(1) ) ...
    * sin ( 4.0 * pi * x(2) );

  h(2,2) = 4.0 + 4.8 * pi^2 * cos ( 3.0 * pi * x(1) ) ...
    * cos ( 4.0 * pi * x(2) );

  return
end
