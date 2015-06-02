function r8vec_sorted_range_test ( )

%*****************************************************************************80
%
%% R8VEC_SORTED_RANGE_TEST tests R8VEC_SORTED_RANGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2010
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SORTED_RANGE_TEST\n' );
  fprintf ( 1, '  R8VEC_SORTED_RANGE seeks the range of indices\n' );
  fprintf ( 1, '  in a sorted vector R so that\n' );
  fprintf ( 1, '  R_LO <= R(I_LO:I_HI) <= R_HI.\n' );

  seed = 123456789;

  for test = 1 : 5

    [ r, seed ] = r8vec_uniform_01 ( n, seed );

    r = r8vec_sort_heap_a ( n, r );

    r8vec_print ( n, r, '  Sorted array R:' );

    [ r_lo, seed ] = r8_uniform_01 ( seed );
    [ r_hi, seed ] = r8_uniform_01 ( seed );

    if ( r_hi < r_lo )
      t = r_lo;
      r_lo = r_hi;
      r_hi = t;
    end

    [ i_lo, i_hi ] = r8vec_sorted_range ( n, r, r_lo, r_hi );

    fprintf ( 1, '\n' );
    if ( i_hi < i_lo )
      fprintf ( 1, '  R_LO  %14f\n', r_lo );
      fprintf ( 1, '  R_HI  %14f\n', r_hi );
      fprintf ( 1, '  Empty range in R.\n' );
    else

      fprintf ( 1, '  R_LO  %14f\n', r_lo );
      for i = i_lo : i_hi
        fprintf ( 1, '  %4d  %14f\n', i, r(i) );
      end
      fprintf ( 1, '  R_HI  %14f\n', r_hi );
    end

  end

  return
end
