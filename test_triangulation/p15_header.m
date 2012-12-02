function p15_header ( )

%*****************************************************************************80
%
%% P15_HEADER prints some information about problem 15.
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
  fprintf ( 1, 'P15:\n' );
  fprintf ( 1, '  Sangbum Kim''s forward step.\n' );
  fprintf ( 1, '\n' );
  boundary_segment_num = p15_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p15_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p15_hole_num ( );
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
