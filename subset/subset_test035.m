function subset_test035 ( )

%*****************************************************************************80
%
%% TEST035 tests I4_TO_CHINESE, CHINESE_TO_I4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  m = [ 3, 4, 5, 7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST035\n' );
  fprintf ( 1, '  I4_TO_CHINESE computes the Chinese Remainder\n' );
  fprintf ( 1, '    representation of an integer.\n' );
  fprintf ( 1, '  CHINESE_TO_I4 computes an integer with the given\n' );
  fprintf ( 1, '    Chinese Remainder representation.\n' );

  i4vec_print ( n, m, '  The moduli:' );

  j = 37;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number being analyzed is %d\n', j );

  r = i4_to_chinese ( j, n, m );

  i4vec_print ( n, r, '  The remainders:' );

  j2 = chinese_to_i4 ( n, m, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reconstructed number is %d\n', j2 );

  r = i4_to_chinese ( j2, n, m );

  i4vec_print ( n, r, '  The remainders of the reconstructed number are:' );

  return
end
