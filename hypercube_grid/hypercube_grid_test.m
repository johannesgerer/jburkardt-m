function hypercube_grid_test ( )

%*****************************************************************************80
%
%% HYPERCUBE_GRID_TEST tests the HYPERCUBE_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERCUBE_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the HYPERCUBE_GRID library.\n' );

  hypercube_grid_test01 ( );
  hypercube_grid_test02 ( );
  hypercube_grid_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERCUBE_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

