function sparse_grid_total_poly_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_TOTAL_POLY_TEST tests the SPARSE_GRID_TOTAL_POLY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_TOTAL_POLY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_TOTAL_POLY library.\n' );

  rules_test ( );
  point_quality_test ( );
  weight_quality_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_TOTAL_POLY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
