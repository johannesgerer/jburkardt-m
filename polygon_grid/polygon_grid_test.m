function polygon_grid_test ( )

%*****************************************************************************80
%
%% POLYGON_GRID_TEST tests the POLYGON_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_GRID_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the POLYGON_GRID library.\n' );

  polygon_grid_count_test ( );

  polygon_grid_points_test01 ( );
  polygon_grid_points_test02 ( );
  polygon_grid_points_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_GRID_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
