function [ x, x2d, tri ] = sensor_data ( EEG )

%*****************************************************************************80
%
%% SENSOR_DATA determines data describing the sensors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2010
%
%  Author:
%
%    Jeff Borggaard
%    John Burkardt
%
%  Parameters:
%
%    Input, EEG, a data structure.
%
%    Output, real X(NPTS,3), the coordinates of the sensors.
%
%    Output, real X2D(NPTS,2), the coordinates of the sensors in a 2D system.
%
%    Output, integer TRI(3,*), the Delaunay triangulation of the X2D data.
%
  plotting = 1;
%
%  Determine the number of sensors.
%
  npts = length ( EEG.chanlocs );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of sensors is %d\n', npts );
%
%  Get the sensor XYZ coordinates.
%
  x = zeros ( npts, 3 );
  for i = 1 : npts
    x(i,:) = [ EEG.chanlocs(i).X, EEG.chanlocs(i).Y, EEG.chanlocs(i).Z ];
  end
%
%  Display the sensor locations.
%
  if ( plotting )
    figure ( 1 )
    plot3 ( x(:,1), x(:,2), x(:,3), '*' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 1: Sensor locations' );
  else
    fprintf ( 1, '  Figure 1, sensor locations, skipped.\n' );
  end
%
%  Set the THETA, PHI and R coordinates of the sensors.
%
  theta = zeros ( npts, 1 );
  phi = zeros ( npts, 1 );

  phi = atan2 ( sqrt ( x(:,1) .* x(:,1) + x(:,2) .* x(:,2) ), x(:,3) );
  theta = atan2 ( x(:,2), x(:,1) );
  radius = sqrt ( x * x' );
%
%  Make a simple 2D coordinate system.
%
  x2d = [ ( phi .* cos ( theta ) ), ( phi .* sin ( theta ) ) ];
%
%  Triangulate the 2D data.
%
  tri = delaunay ( x2d(:,1), x2d(:,2) );

  if ( plotting )
    figure ( 2 )
    hold on
    plot ( x2d(:,1), x2d(:,2), 'b*' ) 
    triplot ( tri, x2d(:,1), x2d(:,2) );
    axis equal
    xlabel ( 'Phi * cos ( Theta )' );
    ylabel ( 'Phi * sin ( Theta )' );
    title ( 'Figure 2: Triangulation of flattened sensor locations' );
    hold off
  else
    fprintf ( 1, '  Figure 2, triangulation of flattened sensor locations, skipped.\n' );
  end

  if ( plotting )
    figure ( 3 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3) )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 3: Triangulated sensors' );
  else
    fprintf ( 1, '  Figure 3, surface plot of triangulated sensors, skipped.\n' );
  end

  return
end
