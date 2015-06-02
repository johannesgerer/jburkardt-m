function r8vec_index_delete_dupes_test ( )

%*****************************************************************************80
%
%% R8VEC_INDEX_DELETE_DUPES_TEST tests R8VEC_INDEX_DELETE_DUPES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
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
  fprintf ( 1, 'R8VEC_INDEX_DELETE_DUPES_TEST\n' );
  fprintf ( 1, '  R8VEC_INDEX_DELETE_DUPES deletes duplicates.\n' );
  fprintf ( 1, '\n' );

  xval = 8.0;
  [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval );

  xval = 7.0;
  [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval );

  seed = 123456789;

  for i = 1 : 20
    [ xval, seed ] = r8_uniform_ab ( 0.0, 20.0, seed );
    xval = round ( xval );
    fprintf ( 1, '  %f\n', xval );
    [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval );
  end

  xval = 7.0;
  [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval );

  xval = 8.0;
  [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d  %3d  %9f  %9f\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call R8VEC_INDEX_DELETE_DUPES to delete duplicates:\n' );

  [ n, x, indx ] = r8vec_index_delete_dupes ( n, x, indx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of unique entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d  %3d  %9f\n', i, indx(i), x(i) );
  end

  return
end
