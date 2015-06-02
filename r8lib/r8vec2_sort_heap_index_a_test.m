function r8vec2_sort_heap_index_a_test ( )

%*****************************************************************************80
%
%% R8VEC2_SORT_HEAP_INDEX_A_TEST tests R8VEC2_SORT_HEAP_INDEX_A.
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
  n = 20;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC2_SORT_HEAP_INDEX_A_TEST\n' );
  fprintf ( 1, '  R8VEC2_SORT_HEAP_INDEX_A creates a sort index\n' );
  fprintf ( 1, '  for an (X,Y) array.\n' );

  [ x, seed ] = i4vec_uniform_ab ( n, 0, n, seed );
  x(1:n) = x(1:n) / n;
  
  [ y, seed ] = i4vec_uniform_ab ( n, 0, n, seed );
  y(1:n) = y(1:n) / n;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The unsorted array:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, X(I), Y(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  indx = r8vec2_sort_heap_index_a ( n, x, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After sorting:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), X(I), Y(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f  %12f\n', i, indx(i), x(i), y(i) );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), X(INDX(I)), Y(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f  %12f\n', ...
      i, indx(i), x(indx(i)), y(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8VEC_PERMUTE carries out the permutation.\n' );

  x = r8vec_permute ( n, x, indx );
  y = r8vec_permute ( n, y, indx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, X(I), Y(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  return
end
