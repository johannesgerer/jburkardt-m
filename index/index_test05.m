function index_test05 ( )

%*****************************************************************************80
%
%% INDEX_TEST05 tests INDEX0N, INDEX1N, INDEXN0 and INDEXN1.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INDEX_TEST05\n' );
  fprintf ( 1, '  For an N-dimensional array,\n' );
  fprintf ( 1, '  INDEX0N column indexes with zero base,\n' );
  fprintf ( 1, '  INDEX1N column indexes with unit base,\n' );
  fprintf ( 1, '  INDEXN0 row indexes with zero base,\n' );
  fprintf ( 1, '  INDEXN1 row indexes with unit base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Min         Index           Max\n' );

  i_min(1) = 1;
  i(1) = 3;
  i_max(1) = 5;
  i_min(2) = 1;
  i(2) = 2;
  i_max(2) = 4;
  i_min(3) = 1;
  i(3) = 1;
  i_max(3) = 3;
  i_min(4) = 1;
  i(4) = 2;
  i_max(4) = 2;

  m = prod ( i_max(1:n) - i_min(1:n) + 1 );

  fprintf ( '  ND Index:   %3d%3d%3d%3d  %3d%3d%3d%3d  %3d%3d%3d%3d\n', ...
    i_min(1:n), i(1:n), i_max(1:n) );
  value = index0n ( n, i_min, i, i_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( '  INDEX0N:    %12d  %12d  %12d\n', index_min, value, index_max );

  value = index1n ( n, i_min, i, i_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( '  INDEX1N:    %12d  %12d  %12d\n', index_min, value, index_max );

  value = indexn0 ( n, i_min, i, i_max );
  index_min = 0;
  index_max = index_min + m - 1;
  fprintf ( '  INDEXN0:    %12d  %12d  %12d\n', index_min, value, index_max );

  value = indexn1 ( n, i_min, i, i_max );
  index_min = 1;
  index_max = index_min + m - 1;
  fprintf ( '  INDEXN1:    %12d  %12d  %12d\n', index_min, value, index_max );

  return
end

