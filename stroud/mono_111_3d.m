function value = mono_111_3d ( n, x )

%*****************************************************************************80
%
%% MONO_111_3D evaluates X**1 Y**1 Z**1.
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
  value = x(1) * x(2) * x(3);

  return
end
