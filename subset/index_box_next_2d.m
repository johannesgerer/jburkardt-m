function [ i, j, more ] = index_box_next_2d ( n1, n2, i, j, more )

%*****************************************************************************80
%
%% INDEX_BOX_NEXT_2D produces index vectors on the surface of a box in 2D.
%
%  Discussion:
%
%    The index vectors are exactly those which are between (1,1) and
%    (N1,N2) with the property that at least one of I and J
%    is an "extreme" value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, the "dimensions" of the box, that is, the
%    maximum values allowed for I and J.  The minimum values are
%    assumed to be 1.
%
%    Input, integer I, J, the previous index set.  The values of I and J
%    are not needed on the first call, with MORE set to FALSE.
%
%    Input, logical MORE, is FALSE on the first call, and TRUE therafter.
%
%    Output, integer I, J, the next index set.
%
%    Output, logical MORE, is TRUE if the routine can be called again
%    for more index sets.
%
  if ( ~more )
    more = 1;
    i = 1;
    j = 1;
    return
  end

  if ( i == n1 & j == n2 )
    more = 0;
    return
  end
%
%  Increment J.
%
  j = j + 1;
%
%  Check J.
%
  if ( n2 < j )
    j = 1;
    i = i + 1;
  elseif ( j < n2 & ( i == 1 | i == n1 ) )

  else
    j = n2;
  end

  return
end
