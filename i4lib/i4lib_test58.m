function i4lib_test58 ( )

%*****************************************************************************80
%
%% TEST58 tests I4VEC_INDEX_INSERT_UNIQUE and I4VEC_INDEX_SEARCH.
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
  fprintf ( 1, 'TEST58\n' );
  fprintf ( 1, '  I4VEC_INDEX_INSERT_UNIQUE inserts unique values into an\n' );
  fprintf ( 1, '  index sorted array.\n' );
  fprintf ( 1, '  I4VEC_INDEX_SEARCH searches for an entry with\n' );
  fprintf ( 1, '  a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate some random values:\n' );

  b = 0;
  c = n_max;
  seed = 123456789;

  for i = 1 : n_max
    [ xval, seed ] = i4_uniform_ab ( b, c, seed );
    [ n, x, indx ] = i4vec_index_insert_unique ( n, x, indx, xval );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Results of search for given XVAL:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  XVAL  Less Equal More\n' );
  fprintf ( 1, '\n' );

  for xval = 0 : 20
    [ less, equal, more ] = i4vec_index_search ( n, x, indx, xval );
    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', xval, less, equal, more );
  end

  return
end
