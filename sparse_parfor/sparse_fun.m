function A_sparse = build_sparse ( )

%*****************************************************************************80
%
%% BUILD_SPARSE demonstrates how a sparse matrix can be assembled in parallel.
%
%  Discussion:
%
%    Actually, what this script demonstrates is how components of the sparse
%    matrix can be evaluated in parallel.  To create the final sparse matrix
%    data structure requires that the "sparse()" command itself be called on
%    a single processor.
%
%    Thus, this script tries to take advantage of parallel processing, assuming
%    that the evaluation of matrix entries is expensive, compared to the minor
%    cost of collecting the entries from each processor to form the final matrix.
%
%    We want to construct a rectangular sparse matrix.  This matrix can be 
%    thought of as a diagonal block matrix, with each diagonal block
%    being of arbitrary size and shape.
%
%    This problem was posed by Vitor Nunes, 18 August 2011.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2011
%
%  Author:
%
%    Gene Cliff
%
%  Parameters:
%
%    Output, real sparse A_sparse(*,*), the sparse matrix.
%
%  Local parameters:
%
%    Local, real A_kb(*,*), used to store one block of the matrix.
%
%    Local, integer i_blk(N_blk), the global row index just before each 
%    block begins.
%
%    Local, cell array II, the global row indices for the entries
%    in each block.
%
%    Local, integer j_blk(N_blk), the global column index just before 
%    each block begins.
%
%    Local, cell array JJ(N_blk,1), the global column indices for the entries
%    in each block.
%
%    Local, integer N_blk, the number of block matrices.
%
%    Local, integer row_blks(N_blk), the row dimension of each block.
%
%    Local, integer col_blks(N_blk), the column dimension of each block.
%
%    Local, cell array VV, the values of the entries in each block.
%

%
%% Set data that defines the arrangement of blocks.
%
%  The row dimension of the global matrix is the sum of row_blks,
%  and the column dimension is the sum of col_blks.  In this
%  case, our matrix has dimensions 44 by 41, and 359 nonzero entries.
%
  N_blk = 5;
  row_blks = [ 4;  7;  9; 10; 14];
  col_blks = [ 8; 10;  5; 10;  8];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Global matrix dimension is M = %d, N = %d\n', ...
    sum ( row_blks ), sum ( col_blks ) );
% 
%% Initialization.
%
  i_blk = cumsum ( row_blks(1:N_blk-1) );
  j_blk = cumsum ( col_blks(1:N_blk-1) );
  i_blk = [ 0; i_blk ];
  j_blk = [ 0; j_blk ];
% 
%  The cell arrays II, JJ, and VV will contain the I, J and value
%  information for the entries in each block.
%
  II = cell ( N_blk, 1);
  JJ = cell ( N_blk, 1);
  VV = cell ( N_blk, 1);
%
%% Loop over the sub-blocks.
%
  parfor k_blk = 1 : N_blk
% 
%  Here, the user would fill in the numeric values of the blocks
%  in a way that depended on the problem that was being set up.
%
%  For this demonstration, CREATE_BLOCK simply assigns arbitrary
%  values to the entries in the block.  In an actual problem, we
%  assume that the evaluation of these entries would be an expensive
%  process, so that parallel execution will result in a substantial
%  speedup.
%
    A_kb = create_block ( k_blk, row_blks(k_blk), col_blks(k_blk) ); 
        
    i_row = 1 : row_blks(k_blk);
%
%  I_BLK and J_BLK tell us how far to shift the local indices to get 
%  the global row and column indices II and JJ.
%
    n_els = row_blks(k_blk) * col_blks(k_blk);

    II{k_blk}(:,1) = i_blk(k_blk) ...
      + reshape ( repmat ( i_row(:), 1, col_blks(k_blk) ), n_els, 1 );

    JJ{k_blk}(:, 1) = j_blk(k_blk) ...
      + reshape ( repmat ( 1:col_blks(k_blk), row_blks(k_blk), 1 ), n_els, 1 );

    VV{k_blk}(:, 1) = reshape ( A_kb, n_els, 1 );             

  end
%
%% Now have the SPARSE command assemble the sparse matrix from the
%  data in the cell arrays.  This command does NOT execute in parallel.
%
  A_sparse = sparse ( cell2mat ( II ), cell2mat ( JJ ), cell2mat ( VV ), ...
    sum ( row_blks ), sum ( col_blks ) );  

  return
end
