function p14_header ( )

%*****************************************************************************80
%
%% P14_HEADER prints some information about problem 14.
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
  fprintf ( 1, 'P14:\n' );
  fprintf ( 1, '  Marcus Garvie''s Lake Alpha and Beta island.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p14_boundary_segment_num ( );
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p14_fixed_num ( );
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p14_hole_num ( );
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
