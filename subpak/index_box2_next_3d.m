function [ i, j, k, more ] = index_box2_next_3d ( n1, n2, n3, ic, jc, kc, i, j, k, more )

%*****************************************************************************80
%
%% INDEX_BOX2_NEXT_3D produces indices on the surface of a box in 3D.
%
%  Discussion:
%
%    The box has a central cell of (IC,JC,KC), with a half widths of
%    (N1,N2,N3).  The indices are exactly those between (IC-N1,JC-N2,KC-N3) and
%    (IC+N1,JC+N2,KC+N3) with the property that at least one of I, J, and K
%    is an "extreme" value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, the "half widths" of the box, that is, the
%    maximum distances from the central cell allowed for I, J and K.
%
%    Input, integer IC, JC, KC, the central cell of the box.
%
%    Input, integer I, J, K, the previous index set.  On the first call,
%    the input values of I, J, and K are ignored.
%
%    Input, logical MORE; On the first call for a given box, the user should
%    set MORE to FALSE.  Thereafter, the input value should simply be the
%    output value from the previous call.
%
%    Output, integer I, J, K, the next index set.  
%
%    Output, logical MORE, the routine sets MORE to TRUE as long as there
%    are more indices.
%
  if ( ~more )
    more = 1;
    i = ic - n1;
    j = jc - n2;
    k = kc - n3;
    return
  end

  if ( i == ic + n1 & j == jc + n2 & k == kc + n3 )
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
  if ( kc + n3 < k )
    k = kc - n3;
    j = j + 1;
  elseif ( k < kc + n3 ...
    ( i == ic - n1 | ...
      i == ic + n1 | ...
      j == jc - n2 | ...
      j == jc + n2 ) )
    return
  else
    k = kc + n3;
    return
  end
%
%  Check J.
%
  if ( jc + n2 < j )
    j = jc - n2;
    i = i + 1;
  elseif ( j < jc + n2 & ...
    ( i == ic - n1 | ...
      i == ic + n1 | ...
      k == kc - n3 | ...
      k == kc + n3 ) )
    return
  else
    j = jc + n2;
    return
  end

  return
end
