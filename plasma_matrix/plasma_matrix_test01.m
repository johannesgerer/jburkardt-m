function plasma_matrix_test01 ( n )

%*****************************************************************************80
%
%% PLASMA_MATRIX_TEST01 creates a plasma matrix and stores it in a file.
%
%  Discussion:
%
%    The use specifies a linear grid dimension of N, corresponding to N^2
%    grid points and N^4 matrix entries.  However, the actual matrix is
%    sparse, to only about 5*N^2 entries are nonzero.  
%
%    MATLAB sparse storage is used for the matrix.  This matrix is then
%    written to a Harwell-Boeing sparse matrix file, and then read back
%    to make sure the information is correct.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the linear order of the spatial grid.
%
  addpath ( '../hb_to_msm' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLASMA_MATRIX_TEST01\n' );
  fprintf ( 1, '  Linear order of spatial grid = %d\n', n );
  fprintf ( 1, '  Number of grid points is %d\n', n * n );
  fprintf ( 1, '  Approximate number of nonzero matrix entries is %d.\n', 5 * n * n );
  fprintf ( 1, '  Full storage matrix would require %d entries.\n', n^4 );

  [ J, F ] = plasma_matrix ( n );

  spy ( J );
  filename = sprintf ( 'plasma_%d_sparsity.png', n );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sparsity image saved as "%s"\n', filename );
%
%  Solve the system J * X = - F.
%
  x = J \ ( - F );
  x_norm = norm ( x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Norm of solution is %g\n', x_norm )
%
%  Write J and F to a Harwell-Boeing file.
%
  hb_filename = sprintf ( 'plasma_%d_rua.txt', n );
  title = sprintf ( 'plasma_%d_rua.txt', n );
  msm_to_hb ( hb_filename, J, F, title, 'Key', 'RUA', 8, 3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix and right hand side saved in Harwell-Boeing\n' );
  fprintf ( 1, '  format file "%s"\n', hb_filename );
%
%  Retrieve J and F.
%
  [ J2, F2 ] = hb_to_msm_and_rhs ( hb_filename );
%
%  Solve the system J2 * X2 = - F2.
%
  x = J2 \ ( - F2 );
  x_norm = norm ( x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  After writing the linear system to a file, and \n' );
  fprintf ( 1, '  retrieving it, the norm of the solution is %g\n', x_norm )

  return
end
