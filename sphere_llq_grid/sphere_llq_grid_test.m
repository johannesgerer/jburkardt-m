function sphere_llq_grid_test ( )

%*****************************************************************************80
%
%% SPHERE_LLQ_GRID_TEST tests the SPHERE_LLQ_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLQ_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_LLQ_GRID library.\n' );

  sphere_llq_grid_point_count_test ( );
  sphere_llq_grid_points_test ( );
  sphere_llq_grid_line_count_test ( );
  sphere_llq_grid_lines_test ( );
  sphere_llq_grid_display_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLQ_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
