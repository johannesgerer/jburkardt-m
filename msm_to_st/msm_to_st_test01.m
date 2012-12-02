function msm_to_st_test01 ( )

%*****************************************************************************80
%
%% MSM_TO_ST_TEST01 tests MSM_TO_ST.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_ST_TEST01\n' );
  fprintf ( 1, '  We will create a simple 5 by 5 matrix,\n' );
  fprintf ( 1, '  convert it to MATLAB sparse format,\n' );
  fprintf ( 1, '  and then have MSM_TO_ST write the matrix to an ST file.\n' );
%
%  Create a simple matrix.
%
  a = [ 11,  0,  0, 14,  0;
         0, 22,  0,  0,  0;
        31, 32, 33, 34, 35;
         0,  0,  0, 44, 45;
        51, 52,  0,  0, 55 ];
%
%  Make a sparse version of the matrix.
%
  b = sparse ( a );
%
%  Have MSM_TO_ST write the sparse matrix to an ST file.
%
  msm_to_st ( b, 'msm_to_st_test01.st' );

  return
end
