function ellipsoid_monte_carlo_test ( )

%*****************************************************************************80
%
%% ELLIPSOID_MONTE_CARLO_TEST tests the ELLIPSOID_MONTE_CARLO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSOID_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ELLIPSOID_MONTE_CARLO library.\n' );

  ellipsoid_monte_carlo_test01 ( );
  ellipsoid_monte_carlo_test02 ( );
  ellipsoid_monte_carlo_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSOID_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

