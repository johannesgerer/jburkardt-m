function A  = create_block ( ii, n_rows, n_cols )

%*****************************************************************************80
%
%% CREATE_BLOCK generates entries for a block of the matrix.
%
%  Discussion:
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2011
%
%  Author:
%
%    Gene Cliff
%
%  Parameters:
%
%    Input, integer II, the index of the block.
%
%    Input, integer N_ROWS, N_COLS, the number of rows and columns
%    in the block.
%
%    Output, real A(N_ROWS,N_COLS), the values that belong to this
%    block of the matrix.
%
  A = zeros ( n_rows, n_cols );

  for i = 1 : n_rows
    for j = 1 : n_cols
      A(i,j) = 10000 * ii + 100 * i + j;
    end
  end

  return
end

