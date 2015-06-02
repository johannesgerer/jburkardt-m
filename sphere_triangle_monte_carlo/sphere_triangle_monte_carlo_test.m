function sphere_triangle_monte_carlo_test ( )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_MONTE_CARLO_TEST tests SPHERE_TRIANGLE_MONTE_CARLO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_TRIANGLE_MONTE_CARLO library.\n' );

  sphere_triangle_monte_carlo_test01 ( )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end