function simplex_grid_test ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST tests the SIMPLEX_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GRID_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SIMPLEX_GRID library.\n' );

  simplex_grid_test01 ( );
  simplex_grid_test02 ( );
  simplex_grid_test03 ( );
  simplex_grid_test04 ( );
  simplex_grid_test05 ( );
  simplex_grid_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GRID_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
