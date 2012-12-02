function na = outlier ( list1, list2 )

%*****************************************************************************80
%
%% OUTLIER finds the node that is not shared by two lists.
%
%  Discussion:
%
%    List1 contains the indices of three nodes, A, B, and C.
%
%    List2 contains the indices of three nodes as well.  Two of these
%    nodes match two values in List1, and one node does not.  We want
%    the value of that "outlier" node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LIST1(3), the indices of 3 nodes.
%
%    Input, integer LIST2(3), the indices of 3 nodes, of which exactly two are
%    expected to be identical to values in LIST1.
%
%    Output, integer NA, the value contained in LIST2 that does not
%    occur in LIST1.  If, for some reason, there is no such value, then
%    NA is returned as -1.
%
  for i = 1 : 3
    na = list2(i);
    if ( all ( list1(1:3) ~= list2(i) ) )
      return
    end
  end

  na = -1;

  return
end
