function value = parallelipiped_volume_3d ( x, y, z )

%*****************************************************************************80
%
%% PARALLELIPIPED_VOLUME_3D returns the volume of a parallelipiped in 3D.
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
%    Input, real X(4), Y(4), Z(4), the coordinates of one corner
%    of the parallelipiped, and its 3 immediate neighbors.
%
%    Output, real PARALLELIPIPED_VOLUME_3D, the volume of
%    the parallelipiped.
%
  value = abs ( ...
    ( z(2) - z(1) ) * ( y(4) * x(3) - y(3) * x(4) ) + ...
    ( z(3) - z(1) ) * ( x(4) * y(2) - x(2) * y(4) ) + ...
    ( z(4) - z(1) ) * ( x(2) * y(3) - x(3) * y(2) ) + ...
    ( z(3) - z(2) ) * ( y(4) * x(1) - y(1) * x(4) ) + ...
    ( z(4) - z(2) ) * ( x(3) * y(1) - x(1) * y(3) ) + ...
    ( z(4) - z(3) ) * ( x(1) * y(2) - x(2) * y(1) ) );

  return
end
