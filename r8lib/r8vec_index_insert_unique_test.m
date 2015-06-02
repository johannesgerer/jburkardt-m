function r8vec_index_insert_unique_test ( )

%*****************************************************************************80
%
%% R8VEC_INDEX_INSERT_UNIQUE_TEST tests R8VEC_INDEX_INSERT_UNIQUE.
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
  fprintf ( 1, 'R8VEC_INDEX_INSERT_UNIQUE_TEST\n' );
  fprintf ( 1, '  R8VEC_INDEX_INSERT_UNIQUE inserts unique values into an\n' );
  fprintf ( 1, '  index sorted array.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate some random values:\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : n_max
    [ xval, seed ] = r8_uniform_ab ( 0.0, 20.0, seed );
    xval = round ( xval );
    fprintf ( 1, '  %f\n', xval );
    [ n, x, indx ] = r8vec_index_insert_unique ( n, x, indx, xval );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indexed list of unique entries:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  INDX(I)  X(I)  X(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d  %3d  %9f  %9f\n', i, indx(i), x(i), x(indx(i)) );
  end

  return
end
