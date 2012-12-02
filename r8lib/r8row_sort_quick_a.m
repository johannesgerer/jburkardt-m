function a = r8row_sort_quick_a ( m, n, a )

%*****************************************************************************80
%
%% R8ROW_SORT_QUICK_A ascending quick sorts an R8ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A.
%
%    Input, real A(M,N), the array to be sorted.
%
%    Output, real A(M,N), the sorted array.
%
  level_max = 30;

  if ( n <= 0 )
    return
  end

  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROW_SORT_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  M < 1.\n' );
    error ( 'R8ROW_SORT_QUICK_A - Fatal error!' );
  end

  if ( m == 1 )
    return
  end

  level = 1;
  rsave(level) = m + 1;
  base = 1;
  m_segment = m;

  while ( 1 )
%
%  Partition the segment.
%
    [ a(base:base+m_segment-1,1:n), l_segment, r_segment ] = r8row_part_quick_a ( ...
      m_segment, n, a(base:base+m_segment-1,1:n) );
%
%  If the left segment has more than one element, we need to partition it.
%
    if ( 1 < l_segment )

      if ( level_max < level )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8ROW_SORT_QUICK_A - Fatal error!\n' );
        fprintf ( 1, '  Exceeding recursion maximum of %d\n', level_max );
        error ( 'R8ROW_SORT_QUICK_A - Fatal error!' );
      end

      level = level + 1;
      m_segment = l_segment;
      rsave(level) = r_segment + base - 1;
%
%  The left segment and the middle segment are sorted.
%  Must the right segment be partitioned?
%
    elseif ( r_segment < m_segment )

      m_segment = m_segment + 1 - r_segment;
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
        m_segment = rsave(level-1) - rsave(level);
        level = level - 1;

        if ( 0 < m_segment )
          break
        end

      end

    end

  end

  return
end
