function msm_to_hb_test01 ( )

%*****************************************************************************80
%
%% MSM_TO_HB_TEST01 tests MSM_TO_HB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MSM_TO_HB_TEST01\n' );
  fprintf ( 1, '  We will create a simple 5 by 5 matrix,\n' );
  fprintf ( 1, '  convert it to MATLAB sparse format,\n' );
  fprintf ( 1, '  and then have MSM_TO_HB write the matrix to a file.\n' );
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
%  Have MSM_TO_HB write the sparse matrix to a file.
%
  msm_to_hb ( 'msm_to_hb_test01.hb', b );

  return
end
