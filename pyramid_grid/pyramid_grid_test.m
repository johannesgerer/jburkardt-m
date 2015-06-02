function pyramid_grid_test ( )

%*****************************************************************************80
%
%% PYRAMID_GRID_TEST tests the PYRAMID_GRID library.
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
  fprintf ( 1, 'PYRAMID_GRID_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PYRAMID_GRID library.\n' );

  pyramid_grid_test01 ( );
  pyramid_grid_test02 ( );
  pyramid_grid_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_GRID_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end