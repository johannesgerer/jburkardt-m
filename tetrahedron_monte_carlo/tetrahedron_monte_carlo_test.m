function tetrahedron_monte_carlo ( )

%*****************************************************************************80
%
%% TETRAHEDRON_MONTE_CARLO_TEST tests TETRAHEDRON_MONTE_CARLO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TETRAHEDRON_MONTE_CARLO library.\n' );
%
%  Try each sampler on the unit tetrahedron, integrating quadratics.
%
  tetrahedron_monte_carlo_test01 ( );
  tetrahedron_monte_carlo_test02 ( );
  tetrahedron_monte_carlo_test03 ( );
  tetrahedron_monte_carlo_test04 ( );
%
%  Try each sampler on a general tetrahedron, integrating a selection of functions.
%
  tetrahedron_monte_carlo_test05 ( );
  tetrahedron_monte_carlo_test06 ( );
  tetrahedron_monte_carlo_test07 ( );
  tetrahedron_monte_carlo_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
