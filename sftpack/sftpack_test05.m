function sftpack_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests R8VEC_SQSTB and R8VEC_SQSTF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2010
%
%  Author:
%
%    John Burkardt
%
  n = 256;
  alo = 0.0;
  ahi = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  For real slow quarter wave sine transforms,\n' );
  fprintf ( 1, '  R8VEC_SQSTF does a forward transform;\n' );
  fprintf ( 1, '  R8VEC_SQSTB does a backward transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data items is N = %d\n', n );
%
%  Set the data values.
%
  seed = 123456789;

  [ x, seed ] = r8vec_uniform ( n, alo, ahi, seed );

  r8vec_print_part ( n, x, 10, '  The original data:' );
%
%  Compute the coefficients.
%
  y = r8vec_sqstf ( n, x );

  r8vec_print_part ( n, y, 10, '  The sine coefficients:' );
%
%  Now compute inverse transform of coefficients.  Should get back the
%  original data.

  x = r8vec_sqstb ( n, y );

  r8vec_print_part ( n, x, 10, '  The retrieved data:' );

  return
end
