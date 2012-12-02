function sftpack_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests C8VEC_SFTB and C8VEC_SFTF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2010
%
%  Author:
%
%    John Burkardt
%
  n = 36;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  For complex slow Fourier transforms,\n' );
  fprintf ( 1, '  C8VEC_SFTF computes the forward transform.\n' );
  fprintf ( 1, '  C8VEC_SFTB computes the backward transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data values, N = %d\n', n );

  seed = 123456789;

  [ x, seed ] = c8vec_uniform_01 ( n, seed );

  c8vec_print_part ( n, x, 10, '  The original data:' );
%
%  Compute the slow Fourier transform of the data.
%
  y = c8vec_sftf ( n, x );

  c8vec_print_part ( n, y, 10, '  The Fourier coefficients:' );
%
%  Now try to retrieve the data from the coefficients.
%
  x2 = c8vec_sftb ( n, y );

  c8vec_print_part ( n, x2, 10, '  The retrieved data:' );

  return
end
