function basis_mn_tet4_test ( )

%*****************************************************************************80
%
%% BASIS_MN_TET4_TEST verifies BASIS_MN_TET4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2009
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
  fprintf ( 1, 'BASIS_MN_TET4_TEST:\n' );
  fprintf ( 1, '  Verify basis functions for element TET4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = 4\n' );

  [ t, seed ] = r8mat_uniform_01 ( 3, 4, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron Nodes:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 4
    fprintf ( 1, '  %8f  %8f  %8f  %8f\n', j, t(1:3,j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at basis nodes\n' );
  fprintf ( 1, '  should form the identity matrix.\n' );
  fprintf ( 1, '\n' );

  phi4 = basis_mn_tet4 ( t, 4, t );

  for i = 1 : 4
    fprintf ( 1, '  %8f  %8f  %8f  %8f\n', phi4(i,1:4) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at ANY point P\n' );
  fprintf ( 1, '  should sum to 1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ------------P-------------    ' );
  fprintf ( 1, '-----------------PHI----------------   PHI_SUM\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ c, seed ] = r8vec_uniform_01 ( 4, seed );

    c_sum = sum ( c(1:4) );
    c(1:4) = c(1:4) / c_sum;
    p(1:3,1) = t(1:3,1:4) * c(1:4)';

    phi1 = basis_mn_tet4 ( t, 1, p );
    phi1_sum = sum ( phi1(1:4,1) );

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
      p(1:3,1), phi1(1:4,1), phi1_sum );

  end

  return
end
