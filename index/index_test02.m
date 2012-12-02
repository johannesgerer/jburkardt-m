function index_test02 ( )

%*****************************************************************************80
%
%% INDEX_TEST02 tests INDEX01, INDEX10, INDEX12 and INDEX21.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INDEX_TEST02\n' );
  fprintf ( 1, '  For a 2D array,\n' );
  fprintf ( 1, '  INDEX01 column indexes with zero base,\n' );
  fprintf ( 1, '  INDEX10 row indexes with zero base,\n' );
  fprintf ( 1, '  INDEX12 column indexes with unit base,\n' );
  fprintf ( 1, '  INDEX21 row indexes with unit base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                Min   Index     Max\n' );
  fprintf ( 1, '\n' );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  fprintf ( 1, '  2D Index:  %3d%3d  %3d%3d  %3d%3d\n', ...
    i_min, j_min, i, j, i_max, j_max );

  value = index01 ( i_min, i, i_max, j_min, j, j_max );
  index_min = 0;
  index_max = index_min + ( i_max - i_min + 1 ) * ( j_max - j_min + 1 ) - 1;
  fprintf ( 1, '  INDEX01:   %6d  %6d  %6d\n', ...
    index_min, value, index_max );

  value = index10 ( i_min, i, i_max, j_min, j, j_max );
  index_min = 0;
  index_max = index_min + ( i_max - i_min + 1 ) * ( j_max - j_min + 1 ) - 1;
  fprintf ( 1, '  INDEX10:   %6d  %6d  %6d\n', ...
    index_min, value, index_max );

  value = index12 ( i_min, i, i_max, j_min, j, j_max );
  index_min = 1;
  index_max = index_min + ( i_max - i_min + 1 ) * ( j_max - j_min + 1 ) - 1;
  fprintf ( 1, '  INDEX12:   %6d  %6d  %6d\n', ...
    index_min, value, index_max );

  value = index21 ( i_min, i, i_max, j_min, j, j_max );
  index_min = 1;
  index_max = index_min + ( i_max - i_min + 1 ) * ( j_max - j_min + 1 ) - 1;
  fprintf ( 1, '  INDEX21:   %6d  %6d  %6d\n', ...
    index_min, value, index_max );

  return
end

