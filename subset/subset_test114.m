function subset_test114 ( )

%*****************************************************************************80
%
%% TEST114 tests PYTHAG_TRIPLE_NEXT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST114\n' );
  fprintf ( 1, '  PYTHAG_TRIPLE_NEXT computes the "next"\n' );
  fprintf ( 1, '    Pythagorean triple.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   A   B   C  A^2+B^2   C^2\n' );
  fprintf ( 1, '\n' );

  i = 0;
  j = 0;

  for k = 0 : 20
    [ a, b, c, i, j ] = pythag_triple_next ( i, j );
    d = a^2 + b^2;
    e = c^2;
    fprintf ( 1, '%4d  %4d  %4d  %4d  %4d  %8d  %8d\n', i, j, a, b, c, d, e );
  end

  return
end
