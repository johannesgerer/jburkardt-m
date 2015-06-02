function hypersphere_surface_test ( )

%*****************************************************************************80
%
%% HYPERSPHERE_SURFACE_TEST tests the HYPERSPHERE_SURFACE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_SURFACE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HYPERSPHERE_SURFACE library.\n' );

  interior_point_characteristic_test ( );
  exterior_point_characteristic_test ( );
  circle_plots ( );
  triangle_plots ( );
  sphere_plots ( );
  cube_plots ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_SURFACE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

