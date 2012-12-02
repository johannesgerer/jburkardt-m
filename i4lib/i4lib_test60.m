function i4lib_test60 ( )

%*****************************************************************************80
%
%% TEST60 tests I4VEC_INDEX_INSERT_UNIQUE and I4VEC_INDEX_ORDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n_max = 20;
  n = 0;
  x = [];
  indx = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST60\n' );
  fprintf ( 1, '  I4VEC_INDEX_INSERT_UNIQUE inserts unique values into\n' );
  fprintf ( 1, '  an index sorted array.\n' );
  fprintf ( 1, '  I4VEC_INDEX_ORDER sorts an index sorted array.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate some random values:\n' );
  fprintf ( 1, '\n' );

  b = 0;
  c = 20;
  seed = 123456789;

  for i = 1 : 20
    [ xval, seed ] = i4_uniform_ab ( b, c, seed );
    fprintf ( 1, '  %6d\n', xval );
    [ n, x, indx ] = i4vec_index_insert_unique ( n, x, indx, xval );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of unique entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call I4VEC_INDEX_ORDER to carry out the sorting:\n' );

  x = i4vec_index_order ( n, x, indx );

  i4vec_print ( n, x, '  X:' );

  return
end
