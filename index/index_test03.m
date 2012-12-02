function index_test03 ( )

%*****************************************************************************80
%
%% INDEX_TEST03 tests INDEX012, INDEX123, INDEX210, and INDEX321.
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
  fprintf ( 1, 'INDEX_TEST03\n' );
  fprintf ( 1, '  For a 3D array,\n' );
  fprintf ( 1, '  INDEX012 column indexes with zero base,\n' );
  fprintf ( 1, '  INDEX123 column indexes with unit base,\n' );
  fprintf ( 1, '  INDEX210 row indexes with zero base,\n' );
  fprintf ( 1, '  INDEX321 row indexes with unit base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                   Min      Index        Max\n' );
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

  m = ( i_max - i_min + 1 ) ...
    * ( j_max - j_min + 1 ) ...
    * ( k_max - k_min + 1 );

  fprintf ( 1, '  3D Index:  %3d%3d%3d  %3d%3d%3d  %3d%3d%3d\n', ...
    i_min, j_min, k_min, i, j, k, i_max, j_max, k_max );

  value = index012 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( 1, '  Index012:  %9d  %9d  %9d\n', ...
    index_min, value, index_max );

  value = index123 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( 1, '  Index123:  %9d  %9d  %9d\n', ...
    index_min, value, index_max );

  value = index210 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( 1, '  Index210:  %9d  %9d  %9d\n', ...
    index_min, value, index_max );

  value = index321 ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( 1, '  Index321:  %9d  %9d  %9d\n', ...
    index_min, value, index_max );

  return
end

