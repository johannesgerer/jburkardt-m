function p11_header ( )

%*****************************************************************************80
%
%% P11_HEADER prints some information about problem 11.
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
  fprintf ( 1, 'P11:\n' );
  fprintf ( 1, '  The L-shaped region.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower left corner of the indentation is\n' );
  fprintf ( 1, '  P = (%f, %f)\n', 0.5, 0.5 );

  fprintf ( 1, '\n' );
  boundary_segment_num = p11_boundary_segment_num ( );  
  fprintf ( 1, '  Number of boundary segments = %d\n', boundary_segment_num );
  fixed_num = p11_fixed_num ( );  
  fprintf ( 1, '  Number of fixed points = %d\n', fixed_num );
  hole_num = p11_hole_num ( );  
  fprintf ( 1, '  Number of holes = %d\n', hole_num );

  return
end
