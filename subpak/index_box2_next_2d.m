function [ i, j, more ] = index_box2_next_2d ( n1, n2, ic, jc, i, j, more )

%*****************************************************************************80
%
%% INDEX_BOX2_NEXT_2D produces indices on the surface of a box in 2D.
%
%  Discussion:
%
%    The box has center at (IC,JC), and has half-widths N1 and N2.
%    The indices are exactly those which are between (IC-N1,JC-N2) and
%    (IC+N1,JC+N2) with the property that at least one of I and J
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
%    Input, integer N1, N2, the half-widths of the box, that is, the
%    maximum distance allowed between (IC,JC) and (I,J).
%
%    Input, integer IC, JC, the central cell of the box.
%
%    Input, integer I, J, the previous index set.
%
%    Input, logical MORE; on the first call for a given box, the user should 
%    set MORE to FALSE.  Thereafter, it should be the output value from the 
%    previous call.
%
%    Output, integer I, J, the next index set.  
%
%    Output, logical MORE; the routine sets MORE to TRUE on output, until
%    there are no more indices to return.
%
  if ( ~more )
    more = 1;
    i = ic - n1;
    j = jc - n2;
    return
  end

  if ( i == ic + n1 & j == jc + n2 )
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
  if ( jc + n2 < j )
    j = jc - n2;
    i = i + 1;
  elseif ( j < jc + n2 & ( i == ic - n1 | i == ic + n1 ) )
    return
  else
    j = jc + n2;
    return
  end

  return
end
