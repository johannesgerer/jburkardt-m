function fpx = fp_circle ( n, x )

%*****************************************************************************80
%
%% FP_CIRCLE defines the jacobian of the implicit function for the circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables, which should be 2.
%
%    Input, real X(N), the variable values.
%
%    Output, real FPX(N-1,N), the jacobian of the function evaluated at X.
%
  fpx = zeros ( n - 1, n );

  fpx(1,1) = 2.0 * x(1);
  fpx(1,2) = 2.0 * x(2);

  return
end
