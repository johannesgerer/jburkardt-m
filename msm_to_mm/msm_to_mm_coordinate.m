function msm_to_mm_coordinate ( output_filename, a, type, symmetry ) 

%*****************************************************************************80
%
%% MSM_TO_MM_COORDINATE writes a MATLAB Sparse Matrix to a Matrix Market file.
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
%    Input, string TYPE, describes the arithmetic data type, as
%    'REAL', 'INTEGER', 'COMPLEX', or 'PATTERN'.
%
%    Input, string SYMMETRY, describes the symmetry type, as 'GENERAL',
%    'SYMMETRIC', 'SKEW-SYMMETRIC' or 'HERMITIAN'.
%
  if ( s_eqi ( type, 'REAL' ) )
    msm_to_mm_coordinate_real ( output_filename, a, symmetry );
  elseif ( s_eqi ( type, 'INTEGER' ) )
    msm_to_mm_coordinate_integer ( output_filename, a, symmetry );
  elseif ( s_eqi ( type, 'COMPLEX' ) )
    msm_to_mm_coordinate_complex ( output_filename, a, symmetry );
  elseif ( s_eqi ( type, 'PATTERN' ) )
    msm_to_mm_coordinate_pattern ( output_filename, a, symmetry );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM_COORDINATE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TYPE.\n' );
    error ( 'MSM_TO_MM_COORDINATE - Fatal error!' );
  end

  return
end
