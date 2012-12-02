function value = parallelipiped_volume_nd ( n, v )

%*****************************************************************************80
%
%% PARALLELIPIPED_VOLUME_ND returns the volume of a parallelipiped in ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, real V(N+1,N); each row contains the coordinates of
%    one of the vertices of the parallelipiped.
%
%    Output, real VALUE, the volume of the parallelipiped.
%
  v2(1:n+1,1:n) = v(1:n+1,1:n);
%
%  Compute the volume of the N-dimensional parallelipiped.
%
  v2(1:n+1,n+1) = 1.0;

  [ v2_lu, pivot, info ] = r8ge_fa ( v2, n+1 );

  if ( info ~= 0 )
    parallelipiped_volume_nd = 0.0;
    return
  end

  det = r8ge_det ( v2_lu, n+1, pivot );

  value = abs ( det );

  return
end
