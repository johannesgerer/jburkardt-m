function p09_header ( )

%*****************************************************************************80
%
%% P09_HEADER prints some information about problem 09.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None.
%
  m = 2;

  center1 = [ 0.50, 0.50 ];
  center2 = [ 0.25, 0.75 ];
  center3 = [ 0.60, 0.40 ];
  r1 = 0.5;
  r2 = 0.1;
  r3 = 0.1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P09:\n' );
  fprintf ( 1, '  Jeff Borggaard''s example\n' );
  fprintf ( 1, '  A square with 2 hexagonal holes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The square has "center" at (%f, %f)\n', center1(1:2) );
  fprintf ( 1, '  and "radius" R1 = %f\n', r1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hexagon 1 has "center" at (%f, %f)\n', center2(1:2) );
  fprintf ( 1, '  and "radius" R2 = %f\n', r2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hexagon 2 has "center" at (%f, %f)\n', center3(1:2) );
  fprintf ( 1, '  and "radius" R3 = %f\n', r3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A uniform mesh density is requested.\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p09_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p09_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p09_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
