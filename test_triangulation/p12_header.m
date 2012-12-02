function p12_header ( )

%*****************************************************************************80
%
%% P12_HEADER prints some information about problem 12.
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
  fprintf ( 1, 'P12:\n' );
  fprintf ( 1, '  John Shadid''s H-shaped region.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  boundary_segment_num = p12_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p12_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p12_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
