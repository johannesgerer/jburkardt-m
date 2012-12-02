function value = simplex_unit_volume_nd ( n )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_VOLUME_ND returns the volume of the unit simplex in ND.
%
%  Integration region:
%
%    The unit simplex in N dimensions,
%      0 <= X(1:N),
%      Sum ( X(1:N) ) <= 1.
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
%    Output, real SIMPLEX_UNIT_VOLUME_ND, the volume of the
%    unit simplex.
%
  value = 1.0 / i4_factorial ( n );

  return
end
