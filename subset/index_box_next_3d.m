function [ i, j, k, more ] = index_box_next_3d ( n1, n2, n3, i, j, k, more )

%*****************************************************************************80
%
%% INDEX_BOX_NEXT_3D produces index vectors on the surface of a box in 3D.
%
%  Discussion:
%
%    The index vectors are exactly those which are between (1,1,1) and
%    (N1,N2,N3) with the property that at least one of I, J, and K
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
%    Input, integer N1, N2, N3, the "dimensions" of the box, that is, the
%    maximum values allowed for I, J and K.  The minimum values are
%    assumed to be 1.
%
%    Input, integer I, J, K, the previous index set.  However, on
%    first call, with MORE = FALSE, the input values of I, J and K are not needed.
%
%    Input, logical MORE, is set to FALSE on the first call, and should be
%    TRUE thereafter.
%
%    Output, integer I, J, K, the next index set.
%
%    Output, logical MORE, is TRUE if there are more index sets available.
%
  if ( ~more )
    more = 1;
    i = 1;
    j = 1;
    k = 1;
    return
  end

  if ( i == n1 & j == n2 & k == n3 )
    more = 0;
    return
  end
%
%  Increment K.
%
  k = k + 1;
%
%  Check K.
%
  if ( n3 < k )
    k = 1;
    j = j + 1;
  elseif ( k < n3 & ( i == 1 | i == n1 | j == 1 | j == n2 ) )
    return
  else
    k = n3;
    return
  end
%
%  Check J.
%
  if ( n2 < j )
    j = 1;
    i = i + 1;
  elseif ( j < n2 & ( i == 1 | i == n1 | k == 1 | k == n3 ) )
    return
  else
    j = n2;
    return
  end

  return
end
