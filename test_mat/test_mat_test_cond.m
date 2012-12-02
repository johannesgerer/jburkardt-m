function test_mat_test_cond ( )

%*****************************************************************************80
%
%% TEST_MAT_TEST_COND tests the condition number computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MAT_TEST_COND\n' );
  fprintf ( 1, '  Compute the condition number of an example of each\n' );
  fprintf ( 1, '  test matrix\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix title             N      COND\n' );
  fprintf ( 1, '\n' );
%
%  AEGERTER matrix.
%
  title = 'AEGERTER';
  n = 5;
  cond = aegerter_condition ( n );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  BAB matrix.
%
  title = 'BAB';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta -25.0 ) / 5.0;
  cond = bab_condition ( n, alpha, beta );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  n = 3;
  cond = bodewig_condition ( );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  COMBIN matrix.
%
  title = 'COMBIN';
  n = 3;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  cond = combin_condition ( alpha, beta, n );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  CONEX3 matrix.
%
  title = 'CONEX3';
  n = 5;
  cond = conex3_condition ( n );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  RUTIS5 matrix.
%
  title = 'RUTIS5';
  n = 4;
  cond = rutis5_condition ( );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  SUMMATION matrix.
%
  title = 'SUMMATION';
  n = 5;
  cond = summation_condition ( n );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  TRI_UPPER matrix.
%
  title = 'TRI_UPPER';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  cond = tri_upper_condition ( alpha, n );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  WILK03 matrix.
%
  title = 'WILK03';
  n = 3;
  cond = wilk03_condition ( );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );
%
%  WILSON matrix.
%
  title = 'WILSON';
  n = 4;
  cond = wilson_condition ( );
  fprintf ( 1, '  %20s  %4d  %14.6g\n', title, n, cond );

  return
end
