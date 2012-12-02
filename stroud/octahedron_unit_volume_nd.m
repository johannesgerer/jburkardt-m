function value = octahedron_unit_volume_nd ( n )

%*****************************************************************************80
%
%% OCTAHEDRON_UNIT_VOLUME_ND returns the volume of the unit octahedron in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( Abs ( X(1:N) ) ) <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Output, real OCTAHEDRON_UNIT_VOLUME_ND, the volume of
%    the unit octahedron.
%
  value = 2^n / prod ( 1 : n );

  return
end
