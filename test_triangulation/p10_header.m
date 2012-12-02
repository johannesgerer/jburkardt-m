function p10_header ( )

%*****************************************************************************80
%
%% P10_HEADER prints some information about problem 10.
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
  fprintf ( 1, 'P10:\n' );
  fprintf ( 1, '  The unit square.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p10_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p10_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p10_hole_num ( )  ;
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
