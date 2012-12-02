function sftpack_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R8VEC_SFTB and R8VEC_SFTF.
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
  n = 36;
  alo = 0.0;
  ahi = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  For real slow Fourier transforms,\n' );
  fprintf ( 1, '  R8VEC_SFTF computes the forward transform.\n' );
  fprintf ( 1, '  R8VEC_SFTB computes the backward transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data values, N = %d\n', n );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform ( n, alo, ahi, seed );

  r8vec_print_part ( n, x, 10, '  The original data:' );
%
%  Compute the slow Fourier transform of the data.
%
  [ azero, a, b ] = r8vec_sftf ( n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A (cosine) coefficients:\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '  %4d  %f\n', 0, azero );

  for i = 1 : floor ( n / 2 )
   fprintf ( 1, '  %4d  %f\n', i, a(i) );
  end 

  fprintf ( 1, '\n' );
  fprintf ( 1, '  B (sine) coefficients:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : floor ( n / 2 )
    fprintf ( 1, '  %4d  %f\n', i, b(i) );
  end
%
%  Now try to retrieve the data from the coefficients.
%
  x = r8vec_sftb ( n, azero, a, b );

  r8vec_print_part ( n, x, 10, '  The retrieved data:' );

  return
end
