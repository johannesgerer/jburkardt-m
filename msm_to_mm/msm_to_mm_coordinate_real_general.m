function msm_to_mm_coordinate_real_general ( output_filename, a ) 

%*****************************************************************************80
%
%% MSM_TO_MM_COORDINATE_REAL_GENERAL writes a "matrix coordinate real general" Matrix Market file.
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
  [ nrow, ncol ] = size ( a );
  nnzeros = nnz ( a );

  fid = fopen ( output_filename, 'wt+' );

  if ( fid < 0 ); 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MSM_TO_MM_COORDINATE_REAL_GENERAL - Fatal error!\n' );
    fprintf ( 1, '  Cannot open the output file.\n' );
    error ( 'MSM_TO_MM_COORDINATE_REAL_GENERAL - Fatal error!'); 
  end;

  fprintf ( fid, '%%%%MatrixMarket matrix coordinate real general\n');
  fprintf ( fid, '%%%%  Created by MSM_TO_MM_COORDINATE_REAL_GENERAL.M\n' );
  fprintf ( fid, '  %d  %d  %d\n', nrow, ncol, nnzeros );

  for j = 1 : ncol
    [ rows, temp, vals ] = find ( a(:,j) );
    sz = size ( rows ); 
    for k2 = 1 : sz
      fprintf ( fid, '  %d  %d  %f\n', rows(k2), j, vals(k2) );
    end
    
  end

  fclose ( fid );

  return
end
