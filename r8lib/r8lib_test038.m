function r8lib_test038 ( )

%*****************************************************************************80
%
%% R8LIB_TEST038 tests R8COL_INSERT and R8COL_SORT_HEAP_A.
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
  m = 3;

  a = [ ...
    2.0,  6.0, 10.0; ...
    4.0,  8.0, 12.0; ...
    1.0,  5.0,  9.0; ...
    3.0,  7.0, 11.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  0.0,  0.0 ]';
  dvec1 = [ 3.0, 7.0, 11.0 ];
  dvec2 = [ 3.0, 4.0, 18.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST038\n' );
  fprintf ( 1, '  R8COL_SORT_HEAP_A ascending heap sorts a table of\n' );
  fprintf ( 1, '  columns.\n' );
  fprintf ( 1, '  R8COL_INSERT inserts new columns.\n' );
  fprintf ( 1, '\n' );

  n = 4;

  r8mat_print ( m, n, a, '  The unsorted matrix:' );

  a = r8col_sort_heap_a ( m, n, a );

  r8mat_print ( m, n, a, '  The sorted matrix:' );

  r8vec_print ( m, dvec1, '  New column:' );

  [ a, n, col ] = r8col_insert ( m, n, a, dvec1 );

  if ( col < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was already in column %d\n', abs ( col ) );
  else
    r8mat_print ( m, n, a, '  The updated matrix:' );
  end

  r8vec_print ( m, dvec2, '  New column:' )

  [ a, n, col ] = r8col_insert ( m, n, a, dvec2 );

  if ( col < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was already in column %d\n', abs ( col ) );
  else
    r8mat_print ( m, n, a, '  The updated matrix:' );
  end

  return
end
