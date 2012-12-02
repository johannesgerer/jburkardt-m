function p08_header ( )

%*****************************************************************************80
%
%% P08_HEADER prints some information about problem 08.
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
  fprintf ( 1, 'P08:\n' );
  fprintf ( 1, '  Strang and Persson example #7\n' );
  fprintf ( 1, '  Pie slice with notch and hole.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A uniform mesh density is requested.\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p08_boundary_segment_num ( );
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p08_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p08_hole_num ( );
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
