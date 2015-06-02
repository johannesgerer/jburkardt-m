function polygon_monte_carlo_test ( )

%*****************************************************************************80
%
%% POLYGON_MONTE_CARLO_TEST tests the POLYGON_MONTE_CARLO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../polygon_triangulate' );

  nv1 = 4;

  v1 = [ ...
    -1.0, -1.0; ...
     1.0, -1.0; ...
     1.0,  1.0; ...
    -1.0,  1.0 ]';

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the POLYGON_MONTE_CARLO library.\n' );

  polygon_monte_carlo_test01 ( nv1, v1 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../polygon_triangulate' );

  return;
end
