function brain_sensor_pod ( )

%*****************************************************************************80
%
%% BRAIN_SENSOR_POD treats each set of 40 brain sensor readings as data.
%
%  Discussion:
%
%    We have a 40 x 1500 x 36 array of data, representing readings from
%    40 sensors, for 1500 time steps, for 36 individuals.
%
%    The sensors are placed at known locations on the head.  We 
%    simplify this information by idealizing the sensors as points
%    on a sphere of unit radius.
%
%    We now consider each set of 40 sensor readings to be an item
%    of data, and we apply POD to this data, seeking the first few
%    dominant or representative modes.  We choose these modes to
%    have unit norm, to be orthogonal, and to be ordered (either
%    in ascending or descending order).  The "most important" modes
%    are those which have the largest projection onto the given data.
%
%    The sensors are geometrically related.  If we make a simplified
%    flattened map of the sensor locations, that preserves neighbors
%    and roughly preserves areas and lengths, it is possible to
%    define a finite element mass matrix for the 2D data, and use
%    this to try to include some spatial weighting in the POD
%    calculation.
%
%    This program carries out both the unweighted and weighted versions
%    of the POD algorithm on the brain sensor data.  It displays
%    the 3 most prominent modes in the data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2010
%
%  Author:
%
%    Jeff Borggaard
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BRAIN_SENSOR_POD\n' );
  fprintf ( 1, '  Given a 40x1500x36 array of data,\n' );
  fprintf ( 1, '  representing 40 sensor readings, 1500 time steps,\n' );
  fprintf ( 1, '  36 individuals, seek a basis for the sensor data\n' );
  fprintf ( 1, '  that reveals the most common sensor data configurations.\n' );
%
%  Load the data.
%
  load brain_data.mat
%
%  We expect "EEG.data" to be a 40 x 1500 x 36 array.
%
  [ n1, n2, n3 ] = size ( EEG.data );
%
%  Reshape the data to a 2D array, with each column a sample set of
%  40 sensor readings.
%
  DD = reshape ( EEG.data, n1, n2 * n3 );
%
%  Read the 3D sensor coordinates, compute a set of 2D flattened
%  coordinates, and a triangulation of them.
%
  [ x, x2d, tri ] = sensor_data ( EEG );
%
%  Apply POD to the unweighted sensor data.
%
  sensor_pod_unweighted ( n1, DD, x, x2d, tri );
%
%  Apply POD to the weighted sensor data.
%
  sensor_pod_weighted ( n1, DD, x, x2d, tri )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BRAIN_SENSOR_POD\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function sensor_pod_unweighted ( npts, DD, x, x2d, tri )

%*****************************************************************************80
%
%% SENSOR_POD_UNWEIGHTED does a POD analysis of the unweighted sensor data.
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
%    Input, integer NPTS, the number of sensors.
%
%    Input, real DD(NPTS,1500*36), the data averaged over the realizations.
%
%    Input, real X(NPTS,3), the coordinates of the sensors.
%
%    Input, real X2D(NPTS,2), the coordinates of the sensors in a 2D system.
%
%    Input, integer TRI(3,*), the Delaunay triangulation of the X2D data.
%
  plotting = 1;
%
%  Apply the standard POD or PCA procedure to the data.
%
    A = DD * DD';
    [ U, D ] = eig ( A );
    S = sqrt ( abs ( diag ( D ) ) );
    pmode = 40;
    qmode = 39;
    rmode = 38;
    smode = 37;
    tmode = 36;
    xmode = 30;
    ymode = 20;
    zmode = 10;

  U1 = r8col_max_one ( npts, npts, U );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  S( 1) = %f\n', S(pmode) );
  fprintf ( 1, '  S( 2) = %f\n', S(qmode) );
  fprintf ( 1, '  S( 3) = %f\n', S(rmode) );
  fprintf ( 1, '  S( 4) = %f\n', S(smode) );
  fprintf ( 1, '  S( 5) = %f\n', S(tmode) );
  fprintf ( 1, '  S(10) = %f\n', S(xmode) );
  fprintf ( 1, '  S(20) = %f\n', S(ymode) );
  fprintf ( 1, '  S(30) = %f\n', S(zmode) );

  if ( plotting )
    figure ( 4 );
    semilogy ( S )
    xlabel ( '-- Mode index --' );
    ylabel ( '-- Mode Value --' );
    title ( 'Figure 4: Singular values' );
  else
    fprintf ( 1, '  Figure 4, Singular values, skipped.\n' );
  end
%
%  Plot dominant modes.
%
  if ( plotting )
    figure ( 5 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,pmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 5: Triangulated sensors, first mode' )
  else
    fprintf ( 1, '  Figure 5, Triangulated sensors, first mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 55 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,pmode), 'FaceColor', 'Interp' )
    view ( 0, 90 )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 55: Triangulated sensors, first mode' )
  else
    fprintf ( 1, '  Figure 55, Triangulated sensors, first mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 6 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,qmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 6: Triangulated sensors, second mode' )
  else
    fprintf ( 1, '  Figure 6, Triangulated sensors, second mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 56 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,qmode), 'FaceColor', 'Interp' )
    view ( 0, 90 )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 56: Triangulated sensors, second mode' )
  else
    fprintf ( 1, '  Figure 56, Triangulated sensors, second mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 7 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,rmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 7: Triangulated sensors, third mode' )
  else
    fprintf ( 1, '  Figure 7, Triangulated sensors, third mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 57 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,rmode), 'FaceColor', 'Interp' )
    view ( 0, 90 )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 57: Triangulated sensors, third mode' )
  else
    fprintf ( 1, '  Figure 57, Triangulated sensors, third mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 8 ); 
    plot ( U(:,pmode)' * DD, 'r' )
    hold on
    plot ( U(:,xmode)' * DD, 'g' )
    hold on
    plot ( U(:,ymode)' * DD, 'b' )
    hold on
    plot ( U(:,zmode)' * DD, 'k' )
    hold off
    title('Figure 8: U''DD, RGBK, modes 1, 10, 20, 30')
  else
    fprintf ( 1, '  Figure 8, V''DD Standard PCA, skipped.\n' );
  end
%
%  Scale so maximum entry is always 1.
%
  if ( plotting )
    figure ( 9 )
    plot ( U1(:,pmode), 'r', 'LineWidth', 2 )
    hold on
    plot ( U1(:,qmode), 'g', 'LineWidth', 2 )
    hold on
    plot ( U1(:,rmode), 'b', 'LineWidth', 2 )
    hold on
    plot ( U1(:,smode), 'c', 'LineWidth', 2 )
    hold on
    plot ( U1(:,tmode), 'k', 'LineWidth', 2 )
    title ('Figure 9: R,G,B,C,K = first 5 modes')
    hold off
  else
    fprintf ( 1, '  Figure 9, First 5 modes, skipped.\n' );
  end

  return
end
function sensor_pod_weighted ( npts, DD, x, x2d, tri )

%*****************************************************************************80
%
%% SENSOR_POD_WEIGHTED does a POD analysis of the weighted sensor data.
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
%    Input, integer NPTS, the number of sensors.
%
%    Input, real DD(NPTS,1500*36), the data averaged over the realizations.
%
%    Input, real X(NPTS,3), the coordinates of the sensors.
%
%    Input, real X2D(NPTS,2), the coordinates of the sensors in a 2D system.
%
%    Input, integer TRI(3,*), the Delaunay triangulation of the X2D data.
%
  plotting = 1;
%
%  Here, the spatial weighting is done on the artificially flattened coordinates.
%
  M = build_mass_2d ( x2d, tri );
  M = full ( M );
  R = chol ( M );

  SN = R * DD;
  Rwx = SN * SN';
  [ U, D ] = eig ( Rwx );
  S = sqrt ( abs ( diag ( D ) ) );

  U1 = r8col_max_one ( npts, npts, U );

  pmode = 40;
  qmode = 39;
  rmode = 38;
  smode = 37;
  tmode = 36;
  xmode = 30;
  ymode = 20;
  zmode = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  S( 1) = %f\n', S(pmode) );
  fprintf ( 1, '  S( 2) = %f\n', S(qmode) );
  fprintf ( 1, '  S( 3) = %f\n', S(rmode) );
  fprintf ( 1, '  S( 4) = %f\n', S(smode) );
  fprintf ( 1, '  S( 5) = %f\n', S(tmode) );
  fprintf ( 1, '  S(10) = %f\n', S(xmode) );
  fprintf ( 1, '  S(20) = %f\n', S(ymode) );
  fprintf ( 1, '  S(30) = %f\n', S(zmode) );

  if ( plotting )
    figure ( 10 );
    semilogy ( S )
    xlabel ( '-- Mode index --' );
    ylabel ( '-- Mode Value --' );
    title ( 'Figure 10: Singular values' );
  else
    fprintf ( 1, '  Figure 10, Singular values, skipped.\n' );
  end
%
%  Plot dominant modes.
%
  if ( plotting )
    figure ( 11 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,pmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 11: Triangulated sensors, first mode'  )
  else
    fprintf ( 1, '  Figure 11, Triangulated sensors, first mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 21 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,pmode), 'FaceColor', 'Interp' )
    view ( 0, 90 );
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 21: Triangulated sensors, first mode' )
  else
    fprintf ( 1, '  Figure 21, Triangulated sensors, first mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 12 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,qmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 12: Triangulated sensors, second mode' )
  else
    fprintf ( 1, '  Figure 12, Triangulated sensors, second mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 22 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,qmode), 'FaceColor', 'Interp' )
    view ( 0, 90 );
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 22: Triangulated sensors, second mode' )
  else
    fprintf ( 1, '  Figure 22, Triangulated sensors, second mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 13 )
    trisurf ( tri, x(:,1), x(:,2), x(:,3), U1(:,rmode), 'FaceColor', 'Interp' )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 13: Triangulated sensors, third mode' )
  else
    fprintf ( 1, '  Figure 13, Triangulated sensors, third mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 23 )
    trisurf ( tri, x2d(:,1), x2d(:,2), U1(:,rmode), 'FaceColor', 'Interp' )
    view ( 0, 90 )
    axis equal
    xlabel ( '-- X --' );
    ylabel ( '-- Y --' );
    zlabel ( '-- Z --' );
    title ( 'Figure 23: Triangulated sensors, third mode' )
  else
    fprintf ( 1, '  Figure 23, Triangulated sensors, third mode, skipped.\n' );
  end

  if ( plotting )
    figure ( 15 ); 
    plot ( U(:,pmode)' * DD, 'r' )
    hold on
    plot ( U(:,xmode)' * DD, 'g' )
    hold on
    plot ( U(:,ymode)' * DD, 'b' )
    hold on
    plot ( U(:,zmode)' * DD, 'k' )
    hold off
    title('Figure 15: U''DD, RGBK, weighted modes 1, 10, 20, 30')
  else
    fprintf ( 1, '  Figure 15, V''DD Standard PCA, skipped.\n' );
  end

  if ( plotting )
    figure ( 14 )
    plot ( U1(:,pmode), 'r', 'LineWidth', 2 )
    hold on
    plot ( U1(:,qmode), 'g', 'LineWidth', 2 )
    hold on
    plot ( U1(:,rmode), 'b', 'LineWidth', 2 )
    hold on
    plot ( U1(:,smode), 'c', 'LineWidth', 2 )
    hold on
    plot ( U1(:,tmode), 'k', 'LineWidth', 2 )
    title ('Figure 14: R,G,B,C,K = first 5 modes')
    hold off
  else
    fprintf ( 1, '  Figure 14, First 5 modes, skipped.\n' );
  end

  return
end
function a = r8col_max_one ( m, n, a )

%*****************************************************************************80
%
%% R8COL_MAX_ONE scales the columns of an R8COL for a maximum of one.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the array.
%
%    Output, real A(M,N), the rescaled array.
%
  for j = 1 : m

    i_big = 1;

    for i = 2 : n
      if ( abs ( a(i_big,j) ) < abs ( a(i,j) ) )
        i_big = i;
      end
    end

    if ( a(i_big,j) ~= 0.0 )
      a(1:m,j) = a(1:m,j) / a(i_big,j);
    end

  end

  return
end

