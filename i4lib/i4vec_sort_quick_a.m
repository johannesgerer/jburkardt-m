function a = i4vec_sort_quick_a ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_QUICK_A ascending sorts an I4VEC using quick sort.
%
%  Example:
%
%    Input:
%
%      N = 7
%
%      A = (/ 6, 7, 3, 2, 9, 1, 8 /)
%
%    Output:
%
%      A = (/ 1, 2, 3, 6, 7, 8, 9 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), the array to be sorted.
%
%    Output, integer A(N), the sorted array.
%
  level_max = 30;

  if ( n <= 1 )
    return
  end

  level = 1;
  rsave(level) = n + 1;
  base = 1;
  n_segment = n;

  while ( 1 )
%
%  Partition the segment.
%
    [ a(base:n), l_segment, r_segment ] = i4vec_part_quick_a ( n_segment, a(base:n) );
%
%  If the left segment has more than one element, we need to partition it.
%
    if ( 1 < l_segment )

      if ( level_max < level )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'I4VEC_SORT_QUICK_A - Fatal error!\n' );
        fprintf ( 1, '  Exceeding recursion maximum of %d\n', level_max );
        error ( 'I4VEC_SORT_QUICK_A - Fatal error!' );
      end

      level = level + 1;
      n_segment = l_segment;
      rsave(level) = r_segment + base - 1;
%
%  The left segment and the middle segment are sorted.
%  Must the right segment be partitioned?
%
    elseif ( r_segment < n_segment )

      n_segment = n_segment + 1 - r_segment;
      base = base + r_segment - 1;
%
%  Otherwise, we back up a level if there is an earlier one.
%
    else

      while ( 1 )

        if ( level <= 1 )
          return
        end

        base = rsave(level);
        n_segment = rsave(level-1) - rsave(level);
        level = level - 1;

        if ( 0 < n_segment )
          break
        end

      end

    end

  end

  return
end
