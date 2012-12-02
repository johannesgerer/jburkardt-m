function p03_header ( )

%*****************************************************************************80
%
%% P03_HEADER prints some information about problem 03.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'P03:\n' );
  fprintf ( 1, '  Strang and Persson example #3\n' );
  fprintf ( 1, '  The unit square, with a hole.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The hole is a concentric circle of radius 0.4.\n' );
  fprintf ( 1, '  A uniform mesh density is requested.\n' );
  fprintf ( 1, '  Element sizes tried were 0.4, 0.2, 0.1.\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p03_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p03_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p03_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
