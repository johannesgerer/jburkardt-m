function sphere_fibonacci_grid_test ( )

%*****************************************************************************80
%
%% SPHERE_FIBONACCI_GRID_TEST tests the SPHERE_FIBONACCI_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_FIBONACCI_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_FIBONACCI_GRID library.\n' );

  sphere_fibonacci_grid_points_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_FIBONACCI_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
