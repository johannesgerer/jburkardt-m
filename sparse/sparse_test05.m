function sparse_test05 ( )

%*****************************************************************************80
%
%% SPARSE_TEST05 sets up a matrix associated with the Poisson equation in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nicholas Higham,
%    Algorithm 694: A Collection of Test Matrices in MATLAB,
%    ACM Transactions on Mathematical Software,
%    Volume 17, Number 3, September 1991, pages 289-305.
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST05:\n' );
  fprintf ( 1, '  Create the sparse matrix associated with the Poisson equation\n' );
  fprintf ( 1, '  on an N by N grid.\n' );

  n_1d = 10;
%
%  Create the sparse 1D second difference matrix.
%
  s = -1.0 * ones ( n_1d - 1, 1 );
  d =  2.0 * ones ( n_1d, 1 );
  d3 = [ [s;0.0] d [0.0;s] ];

  T = spdiags ( d3, -1:1, n_1d, n_1d );
%
%  Use Kronecker products to create the sparse 2D second difference matrix.
%
  I = speye ( n_1d );
  A = kron ( I, T ) + kron ( T, I );

  fprintf ( 1, '  Number of nonzeros is %d\n', nnz ( A ) );
%
%  Copy the data from the matrix.
%
  [ i, j, s ] = find ( A );
  [ m, n ] = size ( A );
%
%  Reconstruct the matrix.
%
  A = sparse ( i, j, s, m, n );

  return
end
