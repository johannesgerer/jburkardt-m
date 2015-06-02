function fx = f_circle ( n, x )

%*****************************************************************************80
%
%% F_CIRCLE defines the implicit function for the circle.
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
%    Output, real FX(N-1), the function evaluated at X.
%
  fx = zeros ( n - 1, 1 );

  fx(1) = x(1).^2 + x(2).^2 - 1.0;

  return
end
