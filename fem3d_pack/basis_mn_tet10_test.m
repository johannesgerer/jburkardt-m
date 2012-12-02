function basis_mn_tet10_test ( )

%*****************************************************************************80
%
%% BASIS_MN_TET10_TEST verifies BASIS_MN_TET10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  test_num = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASIS_MN_TET10_TEST:\n' );
  fprintf ( 1, '  Verify basis functions for element TET10.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = 10.\n' );

  [ t, seed ] = r8mat_uniform_01 ( 3, 4, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron Nodes:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 4
    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %8.4f\n', j, t(1:3,j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at basis nodes\n' );
  fprintf ( 1, '  should form the identity matrix.\n' );
  fprintf ( 1, '\n' );

  p10(1:3,1:4) = t(1:3,1:4);
  p10(1:3, 5)  = 0.5 * ( t(1:3,1) + t(1:3,2) );
  p10(1:3, 6)  = 0.5 * ( t(1:3,2) + t(1:3,3) );
  p10(1:3, 7)  = 0.5 * ( t(1:3,1) + t(1:3,3) );
  p10(1:3, 8)  = 0.5 * ( t(1:3,1) + t(1:3,4) );
  p10(1:3, 9)  = 0.5 * ( t(1:3,2) + t(1:3,4) );
  p10(1:3,10)  = 0.5 * ( t(1:3,3) + t(1:3,4) );

  phi10 = basis_mn_tet10 ( t, 10, p10 );

  for i = 1 : 10
    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f\n', phi10(i,1:10) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at ANY point P\n' );
  fprintf ( 1, '  should sum to 1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ------------P-------------    ' );
  fprintf ( 1, '----------------------------------------------------' );
  fprintf ( 1, 'PHI-----------------------------------------   PHI_SUM\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ c, seed ] = r8vec_uniform_01 ( 4, seed );

    c_sum = sum ( c(1:4) );
    c(1:4,1) = c(1:4) / c_sum;
    p(1:3,1) = t(1:3,1:4) * c(1:4,1);

    phi1 = basis_mn_tet10 ( t, 1, p );
    phi1_sum = sum ( phi1(1:10,1) );

    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f\n', ...
      p(1:3,1), phi1(1:10,1), phi1_sum );

  end

  return
end
