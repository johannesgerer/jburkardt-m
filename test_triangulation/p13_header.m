function p13_header ( )

%*****************************************************************************80
%
%% P13_HEADER prints some information about problem 13.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'P13:\n' );
  fprintf ( 1, '  The Sandia Fork region.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p13_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p13_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p13_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
