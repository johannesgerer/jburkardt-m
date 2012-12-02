function i4lib_test59 ( )

%*****************************************************************************80
%
%% TEST59 tests I4VEC_INDEX_INSERT, I4VEC_INDEX_DELETE_DUPES, I4VEC_INDEX_DELETE_ALL.
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
  n_max = 25;
  n = 0;
  x = [];
  indx = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST59\n' );
  fprintf ( 1, '  I4VEC_INDEX_INSERT inserts values into an\n' );
  fprintf ( 1, '  index sorted array of integers.\n' );
  fprintf ( 1, '  I4VEC_INDEX_DELETE_ALL deletes all copies of a\n' );
  fprintf ( 1, '  particular value.\n' );
  fprintf ( 1, '  I4VEC_INDEX_DELETE_ONE deletes one copies of a\n' );
  fprintf ( 1, '  particular value.\n' );
  fprintf ( 1, '  I4VEC_INDEX_DELETE_DUPES deletes duplicates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate some random values:\n' );
  fprintf ( 1, '\n' );

  xval = 8;
  [ n, x, indx ] = i4vec_index_insert ( n, x, indx, xval );

  xval = 7;
  [ n, x, indx ] = i4vec_index_insert ( n, x, indx, xval );

  b = 0;
  c = 20;
  seed = 123456789;

  for i = 1 : 20
    [ xval, seed ] = i4_uniform_ab ( b, c, seed );
    fprintf ( 1, '  %6d\n', xval );
    [ n, x, indx ] = i4vec_index_insert ( n, x, indx, xval );
  end

  xval = 7;
  [ n, x, indx ] = i4vec_index_insert ( n, x, indx, xval );

  xval = 8;
  [ n, x, indx ] = i4vec_index_insert ( n, x, indx, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_INDEX_DELETE_ONE to delete a value of 8:\n' );

  xval = 8;
  [ n, x, indx ] = i4vec_index_delete_one ( n, x, indx, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_INDEX_DELETE_ALL to delete values of 7:\n' );

  xval = 7;
  [ n, x, indx ] = i4vec_index_delete_all ( n, x, indx, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_INDEX_DELETE_DUPES to delete duplicates:\n' );

  [ n, x, indx ] = i4vec_index_delete_dupes ( n, x, indx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of unique entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %6d\n', i, indx(i), x(i) );
  end

  return
end
