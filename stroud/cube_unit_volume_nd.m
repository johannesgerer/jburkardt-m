function value = cube_unit_volume_nd ( n )

%*****************************************************************************80
%
%% CUBE_UNIT_VOLUME_ND returns the volume of the unit cube in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      -1 <= X(1:N) <= 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Output, real VALUE, the volume of the unit
%    cube in ND.
%
  value = 2.0E+00^n;

  return
end
