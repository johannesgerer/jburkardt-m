function sphere_lebedev_rule_display ( prefix )

%*****************************************************************************80
%
%% SPHERE_LEBEDEV_RULE_DISPLAY displays the points of a Lebedev rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the file prefix.  The full filename is
%    assumed to have the form prefix + ".txt".
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LEBEDEV_RULE_DISPLAY\n' );
  fprintf ( 1, '  Display the points in a Lebedev rule for the sphere.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    prefix = input ( '  Enter the filename prefix: ' );
  end
%
%  Create the filenames.
%
  tpw_filename = strcat ( prefix, '.txt' );
  xyz_filename = strcat ( prefix, '.xyz' );
%
%  Read the data.
%
  tpw = load ( tpw_filename );

  [ n, m ] = size ( tpw );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This rule uses %d points.\n' );
%
%  Convert from degrees to radians.
%
  tpw(:,1) = tpw(:,1) * pi / 180;
  tpw(:,2) = tpw(:,2) * pi / 180;
%
%  Convert from (Theta,Phi) to (X,Y,Z).
%
  x = cos ( tpw(:,1) ) .* sin ( tpw(:,2) );
  y = sin ( tpw(:,1) ) .* sin ( tpw(:,2) );
  z =                     cos ( tpw(:,2) );
%
%  Transpose.
%
  xyz = [ x, y, z ]';
%
%  Write the XYZ file.
%
  r8mat_write ( xyz_filename, m, n, xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating XYZ file "%s".\n', xyz_filename );
%
%  Read the XYZ file back in and display the data.
%
  sphere_xyz_display ( xyz_filename )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LEBEDEV_RULE_DISPLAY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
