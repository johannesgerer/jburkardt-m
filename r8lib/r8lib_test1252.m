function r8lib_test1252 ( )

%*****************************************************************************80
%
%% TEST1252 tests R8VEC_INDEXED_HEAP_D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2010
%
%  Author:
%
%    John Burkardt
%
  m = 20;
  n = 10;

  a(1:m,1) = [ ...
    101.0, 102.0, 103.0, 104.0, 105.0, ...
    106.0, 107.0, 108.0, 109.0, 110.0, ...
    111.0, 112.0, 113.0, 114.0, 115.0, ...
    116.0, 117.0, 118.0, 119.0, 120.0 ]';
  indx(1:n,1) = [ 1, 11, 17, 5, 7, 13, 15, 3, 19, 9 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1252\n' );
  fprintf ( 1, '  R8VEC_INDEXED_HEAP_D creates a descending heap\n' );
  fprintf ( 1, '  from an indexed R8VEC.\n' );
%
%  Print before.
%
  r8vec_print ( m, a, '  The data vector:' );
  i4vec_print ( n, indx, '  The index vector:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %4d\n', i, a(indx(i)) );
  end
%
%  Create the heap.
%
  indx = r8vec_indexed_heap_d ( n, a, indx );
%
%  Print afterwards.  Only INDX should change.
%
  r8vec_print ( m, a, '  The data vector (should NOT change):' );
  i4vec_print ( n, indx, '  The index vector (may change):' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX) is now a heap:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %4d\n', i, a(indx(i)) );
  end

  return
end
