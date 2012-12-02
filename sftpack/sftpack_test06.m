function sftpack_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests R8VEC_SST.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  For slow sine transforms,\n' );
  fprintf ( 1, '  R8VEC_SST does a forward or backward transform.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data items is N = %d\n', n );
%
%  Set the data values.
%
  seed = 123456789;

  [ c, seed ] = r8vec_uniform ( n, alo, ahi, seed );

  r8vec_print_part ( n, c, 10, '  The original data:' );
%
%  Compute the coefficients.
%
  d = r8vec_sst ( n, c );

  r8vec_print_part ( n, d, 10, '  The sine coefficients:' );
%
%  Now compute inverse transform of coefficients.  Should get back the
%  original data.

  e = r8vec_sst ( n, d );

  e(1:n) = e(1:n) / 2 / ( n + 1 );

  r8vec_print_part ( n, e, 10, '  The retrieved data:' );

  return
end
