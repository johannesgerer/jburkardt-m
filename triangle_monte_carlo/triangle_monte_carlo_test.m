function triangle_monte_carlo_test ( )

%*****************************************************************************80
%
%% TRIANGLE_MONTE_CARLO_TEST calls the tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGLE_MONTE_CARLO library.\n' );
%
%  Try each sampler on the unit triangle, integrating X^2, X*Y, Y^2.
%
  triangle_monte_carlo_test01 ( );
  triangle_monte_carlo_test02 ( );
  triangle_monte_carlo_test03 ( );
  triangle_monte_carlo_test04 ( );
%
%  Try each sampler on a general triangle, integrating a selection of functions.
%
  triangle_monte_carlo_test05 ( );
  triangle_monte_carlo_test06 ( );
  triangle_monte_carlo_test07 ( );
  triangle_monte_carlo_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
