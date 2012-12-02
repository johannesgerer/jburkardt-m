function msm_to_mm_coordinate_real ( output_filename, a, symmetry ) 

%*****************************************************************************80
%
%% MSM_TO_MM_COORDINATE_REAL writes a "matrix coordinate real" Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2008
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
    msm_to_mm_coordinate_real_general ( output_filename, a );
  elseif ( s_eqi ( symmetry, 'SYMMETRIC' ) )
    msm_to_mm_coordinate_real_symmetric ( output_filename, a );
  elseif ( s_eqi ( symmetry, 'SKEW-SYMMETRIC' ) )
    msm_to_mm_coordinate_real_skewsymmetric ( output_filename, a );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM_COORDINATE_REAL - Fatal error!\n' );
    fprintf ( 1, '  Illegal symmetry option.\n' );
    error ( 'MSM_TO_MM_COORDINATE_REAL - Fatal error!' );
  end

  return
end
