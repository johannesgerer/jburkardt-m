function [ i, j, more ] = index_box2_next_2d ( n1, n2, ic, jc, i, j, more )

%*****************************************************************************80
%
%% INDEX_BOX2_NEXT_2D produces index vectors on the surface of a box in 2D.
%
%  Discussion:
%
%    The box is has center at (IC,JC), and has half-widths N1 and N2.
%    The index vectors are exactly those which are between (IC-N1,JC-N1) and
%    (IC+N1,JC+N2) with the property that at least one of I and J
%    is an "extreme" value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
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
%    Input, integer I, J, the output value of I and J on the previous call.
%    Input values ignored on first call.
%
%    Input, logical MORE, set this to 0 on the first call, and therafter,
%    set it to its output value on the previous call.
%
%    Output, integer I, J, the next index set.
%
%    Output, logical MORE, is FALSE (or 0) if there are no more indices
%    to return, and TRUE otherwise.
%
  if ( ~ more )
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
