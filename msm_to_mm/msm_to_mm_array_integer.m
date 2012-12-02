function msm_to_mm_array_integer ( output_filename, a, symmetry ) 

%*****************************************************************************80
%
%% MSM_TO_MM_ARRAY_INTEGER writes a "matrix array integer" Matrix Market file.
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
%    Input, string OUTPUT_FILENAME, the name of the file to which the information
%    should be written.
%
%    Input, sparse matrix A, the NROW by NCOL matrix, stored in MATLAB sparse 
%    matrix format, which is to be written to the file.
%
%    Input, string SYMMETRY, describes the symmetry type, as 'GENERAL',
%    'SYMMETRIC', 'SKEW-SYMMETRIC' or 'HERMITIAN'.
%
  if ( s_eqi ( symmetry, 'GENERAL' ) )
    msm_to_mm_array_integer_general ( output_filename, a );
  elseif ( s_eqi ( symmetry, 'SYMMETRIC' ) )
    msm_to_mm_array_integer_symmetric ( output_filename, a );
  elseif ( s_eqi ( symmetry, 'SKEW-SYMMETRIC' ) )
    msm_to_mm_array_integer_skewsymmetric ( output_filename, a );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM_ARRAY_INTEGER - Fatal error!\n' );
    fprintf ( 1, '  Illegal symmetry option.\n' );
    error ( 'MSM_TO_MM_ARRAY_INTEGER - Fatal error!' );
  end

  return
end
