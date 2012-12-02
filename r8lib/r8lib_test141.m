function r8lib_test141 ( )

%*****************************************************************************80
%
%% TEST141 tests R8VEC_SORT_HEAP_MASK_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  mask_num = 10;
  n = 20;

  mask = [ 2, 4, 7, 8, 9, 12, 13, 16, 18, 19 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST141\n' );
  fprintf ( 1, '  R8VEC_SORT_HEAP_MASK_A creates an ascending\n' );
  fprintf ( 1, '    sort index for a masked DVEC.\n' );

  b = 0.0;
  c = 3.0 * n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  r8vec_print ( n, a, '  Unsorted array:' );

  i4vec_print ( mask_num, mask, '  The mask array:' );

  r8vec_mask_print ( n, a, mask_num, mask, '  The masked unsorted array:' );

  indx = r8vec_sort_heap_mask_a ( n, a, mask_num, mask );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After masked indexed ascending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), MASK(INDX(I)), A(MASK(INDX(I)))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : mask_num
    fprintf ( 1, '  %6d  %6d  $6d  %14f\n', i, indx(i), mask(indx(i)), a(mask(indx(i))) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call I4VEC_PERMUTE to carry out the index permutation\n' );
  fprintf ( 1, '  explicitly on the MASK vector.\n' );

  mask = i4vec_permute ( mask_num, mask, indx );
%
%  Essentially, INDX becomes the identity vector now.
%
  indx = i4vec_indicator ( mask_num );

  i4vec_print ( mask_num, mask, '  The reordered mask array:' );

  r8vec_mask_print ( n, a, mask_num, mask, '  The reordered masked sorted array:' );

  return
end
