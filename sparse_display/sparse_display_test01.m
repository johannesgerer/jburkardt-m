function sparse_display_test01 ( )

%*****************************************************************************80
%
%% SPARSE_DISPLAY_TEST01 tests SPY_GE for a general storage matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_DISPLAY_TEST01\n' );
  fprintf ( 1, '  SPY_GE generates a sparsity plot for a matrix stored\n' );
  fprintf ( 1, '  in general (GE) format.\n' );

  nx = 5;
  ny = 5;
  n = wathen_order ( nx, ny );

  seed = 123456789;
  [ a, seed ] = wathen_ge ( nx, ny, n, seed );
  header = 'wathen_ge';

  spy_ge ( n, n, a, header );

  return
end
