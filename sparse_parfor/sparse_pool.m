%% SPARSE_POOL uses the MATLABPOOL command to run the SPARSE_FUN function.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_POOL\n' );
  fprintf ( 1, '  Call SPARSE_FUN to create a sparse matrix in parallel.\n' );

  matlabpool ( 'open', 'local', 4 )

  tic
  A_sparse = sparse_fun ( );
  toc

  matlabpool ( 'close' )
%
%  Display the pattern of the sparse matrix.
%
  spy ( A_sparse );
