function fem1d_pack_test01 ( )

%*****************************************************************************80
%
%% FEM1D_PACK_TEST01 tests LOCAL_BASIS_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  node_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_PACK_TEST01:\n' );
  fprintf ( 1, '  LOCAL_BASIS_1D evaluates the local basis functions\n' );
  fprintf ( 1, '  for a 1D element.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test that the basis functions, evaluated at the nodes,\n' );
  fprintf ( 1, '  form the identity matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  node_x(1:node_num) = [ 1.0, 2.0, 4.0, 4.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node coordinates:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : node_num
    fprintf ( 1, '  %8d  %7.3f\n', j, node_x(j) );
  end

  for j = 1 : node_num
    x = node_x(j);
    phi_matrix(1:node_num,j) = local_basis_1d ( node_num, node_x, x );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(I,J) = PHI(I) at node (J):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : node_num
    for j = 1 : node_num
      fprintf ( 1, '  %7.3f', phi_matrix(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The PHI functions should sum to 1 at random X values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X        Sum ( PHI(:)(X) )\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 5
    [ x, seed ] = r8_uniform_ab ( 1.0, 4.5, seed );
    phi = local_basis_1d ( node_num, node_x, x );
    fprintf ( 1, '  %14.6g  %14.6g\n', x, sum ( phi(1:node_num) ) );
  end

  return
end
