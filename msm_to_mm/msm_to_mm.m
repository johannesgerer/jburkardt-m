function msm_to_mm ( output_filename, a, format, type, symmetry ) 

%*****************************************************************************80
%
%% MSM_TO_MM writes a MATLAB Sparse Matrix to a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the name of the file to which the information
%    should be written.
%
%    Input, sparse matrix A, the NROW by NCOL matrix, stored in MATLAB sparse 
%    matrix format, which is to be written to the file.
%
%    Input, string FORMAT, is 'COORDINATE' for a sparse matrix, or 'ARRAY'
%    for a dense matrix.
%
%    Input, string TYPE, is 'REAL', 'INTEGER', 'COMPLEX', or 'PATTERN'.
%
%    Input, string SYMMETRY is 'GENERAL', 'SYMMETRIC', 'SKEW-SYMMETRIC'
%    or 'HERMITIAN'.
%
  if ( s_eqi ( format, 'coordinate' ) )
    msm_to_mm_coordinate ( output_filename, a, type, symmetry );
  elseif ( s_eqi ( format, 'array' ) )
    msm_to_mm_array ( output_filename, a, type, symmetry );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized choice for FORMAT = "%s".\n', format );
    error ( 'MSM_TO_MM - Fatal error!' );
  end

  return
end
