function sftpack_test11 ( )

%*****************************************************************************80
%
%% SFTPACK_TEST11 tests C8MAT_SFTB and C8MAT_SFTF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 June 2010
%
%  Author:
%
%    John Burkardt
%
  n1 = 10;
  n2 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFTPACK_TEST11\n' );
  fprintf ( 1, '  For complex slow Fourier transforms,\n' );
  fprintf ( 1, '  C8MAT_SFTF computes the forward transform.\n' );
  fprintf ( 1, '  C8MAT_SFTB computes the backward transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data has dimension N1 = %d by N2 = %d\n', n1, n2 );

  seed = 123456789;

  [ x, seed ] = c8mat_uniform_01 ( n1, n2, seed );

  c8mat_print_some ( n1, n2, x, 1, 1, 10, 10, '  The data X:' );
%
%  Compute the slow Fourier transform of the data.
%
  y = c8mat_sftf ( n1, n2, x );

  c8mat_print_some ( n1, n2, y, 1, 1, 10, 10, '  The Fourier coefficients Y:' );

  x2 = c8mat_sftb ( n1, n2, y );

  c8mat_print_some ( n1, n2, x2, 1, 1, 10, 10, '  The recovered data:' );

  return
end
