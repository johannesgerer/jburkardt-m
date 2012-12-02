function r8lib_test0385 ( )

%*****************************************************************************80
%
%% R8LIB_TEST0385 tests R8COL_SORT_HEAP_INDEX_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
  clear

  m = 3;
  n = 15;

  a = [ ...
    2.0,  6.0, 10.0; ...
    4.0,  8.0, 12.0; ...
    1.0,  5.0,  9.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  6.0,  0.0; ...
    3.0,  4.0, 18.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  6.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  0.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    1.0,  5.0,  9.0; ...
    1.0,  5.0,  9.1; ...
    1.0,  5.1,  9.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST0385\n' );
  fprintf ( 1, '  R8COL_SORT_HEAP_INDEX_A computes an index vector which\n' );
  fprintf ( 1, '  ascending heap sorts an R8COL.\n' );

  r8mat_transpose_print ( m, n, a, '  The unsorted R8COL (transposed):' );

  indx = r8col_sort_heap_index_a ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The (implicitly) sorted R8COL (transposed)\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    j2 = indx(j);
    fprintf ( 1, '  %4d:  ', j2 );
    for i = 1 : m
      fprintf ( 1, '  %10f', a(i,j2) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
