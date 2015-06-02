function i4vec_heap_d_insert_test ( )

%*****************************************************************************80
%
%% I4VEC_HEAP_D_INSERT_TEST tests I4VEC_HEAP_D_INSERT.
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
  fprintf ( 1, 'I4VEC_HEAP_D_INSERT_TEST\n' );
  fprintf ( 1, '  For a descending heap of integers,\n' );
  fprintf ( 1, '  I4VEC_HEAP_D_INSERT inserts a value into the heap.\n' );

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

  return
end
