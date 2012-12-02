function value = simplex_volume_nd ( n, v )

%*****************************************************************************80
%
%% SIMPLEX_VOLUME_ND returns the volume of a simplex in ND.
%
%  Integration region:
%
%    The simplex bounded by the origin and a convex combination of N points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, real V(N+1,N), each of the
%    N+1 rows of V contains the N coordinates of one of the
%    vertices of the simplex.
%
%    Output, real VALUE, the volume of the unit simplex.
%

%
%  Compute the volume of the parallelipiped.
%
  volume = parallelipiped_volume_nd ( n, v );
%
%  Multiply by the volume of the unit simplex, which serves as a
%  conversion factor between a parallelipiped and the simplex.
%
  value = volume * simplex_unit_volume_nd ( n );

  return
end
