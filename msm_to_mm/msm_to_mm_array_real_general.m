function msm_to_mm_array_real_general ( output_filename, a ) 

%*****************************************************************************80
%
%% MSM_TO_MM_ARRAY_REAL_GENERAL writes a "matrix array real general" Matrix Market file.
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
  [ nrow, ncol ] = size ( a );

  fid = fopen ( output_filename, 'wt+' );

  if ( fid < 0 ); 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM_ARRAY_REAL_GENERAL - Fatal error!\n' );
    fprintf ( 1, '  Cannot open the output file.\n' );
    error ( 'MSM_TO_MM_ARRAY_REAL_GENERAL - Fatal error!' );
  end

  fprintf ( fid, '%%%%MatrixMarket matrix array real general\n');
  fprintf ( fid, '%%%%  Created by MSM_TO_MM_ARRAY_REAL_GENERAL.M\n' );
  fprintf ( fid, '  %d  %d\n', nrow, ncol );

  for j = 1 : ncol
    for i = 1 : nrow
      fprintf ( fid, '  %f\n', a(i,j) );
    end
  end

  fclose ( fid );

  return
end
