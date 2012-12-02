function basis_brick20_test ( )

%*****************************************************************************80
%
%% BASIS_BRICK20_TEST verifies BASIS_BRICK20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  node_num = 20;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASIS_BRICK20_TEST:\n' );
  fprintf ( 1, '  Verify basis functions for element BRICK20.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at basis nodes\n' );
  fprintf ( 1, '  should form the identity matrix.\n' );
  fprintf ( 1, '\n' );

  n = node_num;

  p = nodes_brick20 ( );

  phi = basis_brick20 ( n, p );

  for j = 1 : n
    fprintf ( 1, '  ' );
    for i = 1 : node_num
      fprintf ( 1, '%7.3f', phi(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at ANY point P\n' );
  fprintf ( 1, '  should sum to 1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ------------P-------------     PHI_SUM\n' );
  fprintf ( 1, '\n' );

  n = test_num;

  seed = 123456789;

  [ p, seed ] = r8mat_uniform_01 ( 3, n, seed );

  phi = basis_brick20 ( n, p );

  for j = 1 : n
    phi_sum = sum ( phi(1:node_num,j) );
    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %8.4f\n',  p(1:3,j), phi_sum );
  end

  return
end
