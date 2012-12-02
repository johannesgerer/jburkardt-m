function i4lib_test56 ( )

%*****************************************************************************80
%
%% TEST56 tests I4VEC_HEAP_D_EXTRACT, I4VEC_HEAP_D_INSERT and I4VEC_HEAP_D_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST56\n' );
  fprintf ( 1, '  For a descending heap of integers,\n' );
  fprintf ( 1, '  I4VEC_HEAP_D_INSERT inserts a value into the heap.\n' );
  fprintf ( 1, '  I4VEC_HEAP_D_EXTRACT extracts the maximum value;\n' );
  fprintf ( 1, '  I4VEC_HEAP_D_MAX reports the maximum value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  These 3 operations are enough to model a priority queue.\n' );

  n = 0;
  a = [];
  seed = 123456789;

  for i = 1 : n_max

    b = 0;
    c = 10;

    [ val, seed ] = i4_uniform_ab ( b, c, seed );

    [ n, a ] = i4vec_heap_d_insert ( n, a, val );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Inserting value %d\n', val );

    val = i4vec_heap_d_max ( n, a );

    fprintf ( 1, '  Current maximum value is %d\n', val );

  end

  i4vec_print ( n, a, '  Current heap as a vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now extract the maximum several times.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ val, n, a ] = i4vec_heap_d_extract ( n, a );
    fprintf ( 1, '  Extracting maximum element = %d\n', val );
  end

  i4vec_print ( n, a, '  Current heap as a vector:' );

  return
end
