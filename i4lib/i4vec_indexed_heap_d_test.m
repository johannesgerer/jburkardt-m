function i4vec_indexec_heap_d_test ( )

%*****************************************************************************80
%
%% I4VEC_INDEXED_HEAP_D_TEST tests I4VEC_INDEXED_HEAP_D;
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
    101, 102, 103, 104, 105, 106, 107, 108, 109, 110, ...
    111, 112, 113, 114, 115, 116, 117, 118, 119, 120 ]';
  indx(1:n,1) = [ 1, 11, 17, 5, 7, 13, 15, 3, 19, 9 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_INDEXED_HEAP_D_TEST\n' );
  fprintf ( 1, '  I4VEC_INDEXED_HEAP_D creates a descending heap\n' );
  fprintf ( 1, '  from an indexed vector.\n' );
%
%  Print before.
%
  i4vec_print ( m, a, '  The data vector:' );
  i4vec_print ( n, indx, '  The index vector:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %4d\n', i, a(indx(i)) );
  end
%
%  Heap the data.
%
  indx = i4vec_indexed_heap_d ( n, a, indx );
%
%  Print afterwards.  Only INDX should change.
%
  i4vec_print ( m, a, '  The data vector (should NOT change):' );
  i4vec_print ( n, indx, '  The index vector (may change):' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX) is now a descending heap:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %4d\n', i, a(indx(i)) );
  end

  return
end
