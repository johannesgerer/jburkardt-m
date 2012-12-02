function index_test04 ( )

%*****************************************************************************80
%
%% INDEX_TEST04 tests INDEX0123, INDEX1234, INDEX3210, and INDEX4321.
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
  fprintf ( 1, 'INDEX_TEST04\n' );
  fprintf ( 1, '  For a 4D array,\n' );
  fprintf ( 1, '  INDEX0123 column indexes with zero base,\n' );
  fprintf ( 1, '  INDEX1234 column indexes with unit base,\n' );
  fprintf ( 1, '  INDEX3210 row indexes with zero base,\n' );
  fprintf ( 1, '  INDEX4321 row indexes with unit base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Min         Index           Max\n' );
  fprintf ( 1, '\n' );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  k_min = 1;
  k = 1;
  k_max = 3;
  l_min = 1;
  l = 2;
  l_max = 2;

  m = ( i_max - i_min + 1 ) ...
    * ( j_max - j_min + 1 ) ...
    * ( k_max - k_min + 1 ) ...
    * ( l_max - l_min + 1 );

  fprintf ( 1, '  4D Index:   %3d%3d%3d%3d  %3d%3d%3d%3d  %3d%3d%3d%3d\n', ...
    i_min, j_min, k_min, l_min, i, j, k, l, i_max, j_max, k_max, l_max );

  value = index0123 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, l_min, l, l_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( 1, '  INDEX0123:  %12d  %12d  %12d\n', index_min, value, index_max );

  value = index1234 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, l_min, l, l_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( 1, '  INDEX1234:  %12d  %12d  %12d\n', index_min, value, index_max );

  value = index3210 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, l_min, l, l_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( 1, '  INDEX3210:  %12d  %12d  %12d\n', index_min, value, index_max );

  value = index4321 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, l_min, l, l_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( 1, '  INDEX4321:  %12d  %12d  %12d\n', index_min, value, index_max );

  return
end

