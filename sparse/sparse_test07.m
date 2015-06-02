function sparse_test07 ( )

%*****************************************************************************80
%
%% SPARSE_TEST07 times the zeroing out of matrix elements.
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
  fprintf ( 1, 'SPARSE_TEST07:\n' );
  fprintf ( 1, '  Zero out some elements of a sparse matrix.\n' );
  fprintf ( 1, '  Compare the time required when using full storage,\n' );
  fprintf ( 1, '  sparse storage,\n' );
  fprintf ( 1, '  sparse storage with the sparse triplet representation.\n' );

  n = 2000;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix is of size %d by %d\n', n, n );
  fprintf ( 1, '  Initial number of nonzeros is %d\n', n * n );

  for amax = [ 1, n * n / 2, n * n - 1 ]

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Zero out all entries greater than %d\n', amax );

    A = magic ( n );
    tic
    A(A>amax) = 0.0;
    t = toc;
    fprintf ( 1, '  Full storage matrix required %g seconds\n', t );

    A = magic ( n );
    A = sparse ( A );
    tic
    A(A>amax) = 0.0;
    t = toc;
    fprintf ( 1, '  Sparse storage matrix required %g seconds\n', t );

    A = magic ( n );
    A = sparse ( A );
    tic
    [ i, j, s ] = find ( A );
    k = find ( s <= amax );
    A = sparse ( i(k), j(k), s(k), n, n );
    t = toc;
    fprintf ( 1, '  Using sparse triplet required %g seconds\n', t );
    fprintf ( 1, '  Number of nonzeros is %d\n', nnz ( A ) );

  end

  return
end
