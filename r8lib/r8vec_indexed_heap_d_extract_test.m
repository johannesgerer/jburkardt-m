function r8vec_indexed_heap_d_extract_test ( )

%*****************************************************************************80
%
%% R8VEC_INDEXED_HEAP_D_EXTRACT_TEST tests R8VEC_INDEXED_HEAP_D_EXTRACT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  m = 20;
  n_max = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_INDEXED_HEAP_D_EXTRACT_TEST\n' );
  fprintf ( 1, '  For an indexed R8VEC,\n' );
  fprintf ( 1, '  R8VEC_INDEXED_HEAP_D_EXTRACT extracts the maximum value;\n' );
%
%  Set the data array.  To keep things easy, we will use the indicator vector.
%
  a = r8vec_indicator1 ( m );
%
%  The index array will initially be a random subset of the numbers 1 to M,
%  in random order.
%
  n = 5;
  indx(1:11,1) = [ 9, 2, 8, 14, 5, 7, 15, 1, 19, 20, 3 ]';

  r8vec_print ( m, a, '  The data vector:' );
  i4vec_print ( n, indx, '  The index vector:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %14.6f\n', i, a(indx(i)) );
  end
%
%  Create the descending heap.
%
  indx = r8vec_indexed_heap_d ( n, a, indx );

  i4vec_print ( n, indx, '  The index vector after heaping:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX) after heaping:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %14.6f\n', i, a(indx(i)) );
  end
%
%  Extract the first 5 largest elements.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now extract the maximum several times.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ indx_extract, n, indx ] = r8vec_indexed_heap_d_extract ( n, a, indx );
    fprintf ( 1, '  Extracting maximum element A(%d) = %f\n', ...
      indx_extract, a(indx_extract) );
  end

  r8vec_print ( m, a, '  The data vector after extractions:' );
  i4vec_print ( n, indx, '  The index vector after extractions:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(INDX) after extractions:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %14.6f\n', i, a(indx(i)) );
  end

  return
end
