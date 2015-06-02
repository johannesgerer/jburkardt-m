function polynomial_compress_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_COMPRESS_TEST tests POLYNOMIAL_COMPRESS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  o = 10;

  c = [ 7.0, - 5.0, 5.0, 9.0, 11.0, 3.0, 6.0, 0.0, - 13.0, 1.0E-20 ];
  e = [ 1, 2, 2, 4, 5, 5, 5, 12, 33, 35 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_PRINT_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_PRINT prints a polynomial.\n' );

  fprintf ( 1, '\n' );
  title = '  Uncompressed P(X) =';
  polynomial_print ( m, o, c, e, title );

  [ o2, c2, e2 ] = polynomial_compress ( o, c, e );

  fprintf ( 1, '\n' );
  title = '  Compressed P(X) =';
  polynomial_print ( m, o2, c2, e2, title );

  return
end