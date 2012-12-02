function value = mono_422_3d ( n, x )

%*****************************************************************************80
%
%% MONO_422_3D evaluates X**4 Y**2 Z**2.
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real X(N), the point at which the monomial is to be evaluated.
%
%    Output, real VALUE, the value of the monomial.
%
  value = x(1)^4 * x(2)^2 * x(3)^2;

  return
end
