function linplus_test2655 ( )

%*****************************************************************************80
%
%% TEST2655 tests R8GB_TO_R8S3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 8;
  ml = 2;
  mu = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2655\n' );
  fprintf ( 1, '  R8GB_TO_R8S3 copies a R8GB matrix to a R8S3 matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =      %d\n', m );
  fprintf ( 1, '  Matrix columns N =   %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8gb_indicator ( m, n, ml, mu );

  r8gb_print ( m, n, ml, mu, a, '  The R8GB matrix:' );

  nz_num = r8gb_nz_num ( m, n, ml, mu, a );

  fprintf ( 1, '  Nonzeros NZ_NUM =    %d\n', nz_num );

  [ isym, row, col, b ] = r8gb_to_r8s3 ( m, n, ml, mu, a, nz_num );

  r8s3_print ( m, n, nz_num, isym, row, col, b, '  The R8S3 matrix:' );

  return
end
