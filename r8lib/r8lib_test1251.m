function r8lib_test1251 ( )

%*****************************************************************************80
%
%% R8LIB_TEST1251 tests R8VEC_INDEX_SORTED_RANGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2010
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST1251\n' );
  fprintf ( 1, '  R8VEC_INDEX_SORTED_RANGE seeks the range I_LO:I_HI\n' );
  fprintf ( 1, '  of entries of sorted indexed R so that\n' );
  fprintf ( 1, '  R_LO <= R(INDX(I)) <= R_HI for I_LO <= I <= I_HI.\n' );

  seed = 123456789;

  for test = 1 : 5

    [ r, seed ] = r8vec_uniform_01 ( n, seed );

    r8vec_print ( n, r, '  Array' );

    indx = r8vec_sort_heap_index_a ( n, r );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I  INDX    R(INDX(I))\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %4d  %4d  %14f\n', i, indx(i), r(indx(i)) );
    end

    [ r_lo, seed ] = r8_uniform_01 ( seed );
    [ r_hi, seed ] = r8_uniform_01 ( seed );

    if ( r_hi < r_lo )
      t = r_lo;
      r_lo = r_hi;
      r_hi = t;
    end

    [ i_lo, i_hi ] = r8vec_index_sorted_range ( n, r, indx, r_lo, r_hi );

    fprintf ( 1, '\n' );
    if ( i_hi < i_lo )
      fprintf ( 1, '  R_LO        %14f\n', r_lo );
      fprintf ( 1, '  R_HI        %14f\n', r_hi );
      fprintf ( 1, '  Empty range in R.\n' );
    else

      fprintf ( 1, '  R_LO        %14f\n', r_lo );
      for i = i_lo : i_hi
        fprintf ( 1, '  %4d  %4d  %14f\n', i, indx(i), r(indx(i)) );
      end
      fprintf ( 1, '  R_HI        %14f\n', r_hi );
    end

  end

  return
end
