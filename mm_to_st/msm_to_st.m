function msm_to_st ( a, output_filename )

%*****************************************************************************80
%
%% MSM_TO_ST writes a MATLAB Sparse Matrix to an ST Sparse Triplet file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real sparse A(), the MATLAB Sparse Matrix.
%
%    Input, string OUTPUT_FILENAME, the name of the ST file.
%
  [ nrow, ncol ] = size ( a );
  nnzero = nnz ( a );

  [ rows, cols, vals ] = find ( a );

  base0 = 0;
  base1 = 1;
  rows = st_rebase ( base1, base0, nnzero, rows );
  cols = st_rebase ( base1, base0, nnzero, cols );

  st_header_write ( output_filename, nrow, ncol, nnzero );

  st_data_write ( output_filename, nrow, ncol, nnzero, rows, cols, vals );

  return
end
