function sphere_monte_carlo_test ( )

%*****************************************************************************80
%
%% SPHERE_MONTE_CARLO_TEST tests the SPHERE_MONTE_CARLO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_MONTE_CARLO library.\n' );

  sphere_monte_carlo_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end