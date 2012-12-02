function a = r8col_sort_quick_a ( m, n, a )

%*****************************************************************************80
%
%% R8COL_SORT_QUICK_A ascending quick sorts an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the row order of A, and the length of a column.
%
%    Input, integer N, the number of columns of A.
%
%    Input, real A(M,N), the array to be sorted.
%
%    Output, real A(M,N), the sorted array.
%
  level_max = 30;

  if ( m <= 0 )
    return
  end

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8COL_SORT_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    error ( 'R8COL_SORT_QUICK_A - Fatal error!' );
  end

  if ( n == 1 )
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
    [ a(1:m,base:n), l_segment, r_segment ] = r8col_part_quick_a ( m, n_segment, a(1:m,base:n) );
%
%  If the left segment has more than one element, we need to partition it.
%
    if ( 1 < l_segment )

      if ( level_max < level )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8COL_SORT_QUICK_A - Fatal error!\n' );
        fprintf ( 1, '  Exceeding recursion maximum of %d\n', level_max );
        error ( 'R8COL_SORT_QUICK_A - Fatal error!' );
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
