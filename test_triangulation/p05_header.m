function p05_header ( )

%*****************************************************************************80
%
%% P05_HEADER prints some information about problem 05.
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
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    None.
%
  m = 2;

  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 = 1.0;
  r2 = 0.55;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P05:\n' );
  fprintf ( 1, '  Strang and Persson example #5\n' );
  fprintf ( 1, '  The horn.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circle C1 has center = (0,0)\n' );
  fprintf ( 1, '  Radius R1 = %f\n', r1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circle C2 has center = (-0.4,0)\n' );
  fprintf ( 1, '  Radius R2 = %f\n', r2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Points in the region are:\n' );
  fprintf ( 1, '    in C1 and not in C2 and have 0 <= Y.\n' );
  fprintf ( 1, '  A uniform mesh density is requested.\n' );
  fprintf ( 1, '  Element sizes tried were 0.4, 0.2, 0.1.\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p05_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p05_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p05_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
