function r8vec_index_search_test ( )

%*****************************************************************************80
%
%% R8LIB_TEST125 tests R8VEC_INDEX_SEARCH.
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
  n_max = 20;
  n = 0;
  x = [];
  indx = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST125\n' );
  fprintf ( 1, '  R8VEC_INDEX_SEARCH searches for an entry\n' );
  fprintf ( 1, '  with a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate some random values:\n' );
  fprintf ( 1, '\n' );

  b = 0.0;
  c = n_max;
  seed = 123456789;

  for i = 1 : n_max
    [ xval, seed ] = r8_uniform_ab ( b, c, seed );
    xval = round ( xval );
    fprintf ( 1, '  %f\n', xval );
    [ n, x, indx ] = r8vec_index_insert_unique ( n, x, indx, xval );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d  %3d  %9f  %9f\n', i, indx(i), x(i), x(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Results of search for given XVAL:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  XVAL  Less Equal More\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n_max
    xval = i;
    [ less, equal, more ] = r8vec_index_search ( n, x, indx, xval );
    fprintf ( 1, '  %6f  %3d  %3d  %3d\n', xval, less, equal, more );
  end

  return
end
