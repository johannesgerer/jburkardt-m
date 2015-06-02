function result = tree_rooted_code_compare ( nnode, npart, code1, code2 )

%*****************************************************************************80
%
%% TREE_ROOTED_CODE_COMPARE compares a portion of the code for two rooted trees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes.
%
%    Input, integer NPART, the number of nodes for which the code
%    has been determined.  This determines the portion of the codes to be
%    compared.  We expect 0 <= NPART <= NNODE.
%
%    Input, integer CODE1(2*NNODE), CODE2(2*NNODE), the two 
%    rooted tree codes to be compared.
%
%    Output, integer RESULT, the result of the comparison.
%    -1, CODE1 < CODE2,
%     0, CODE1 = CODE2,
%    +1, CODE1 > CODE2.
%
  result = 0;

  if ( npart <= 0 )
    return
  end

  ihi = 2 * min ( npart, nnode );

  for i = 1 : ihi

    if ( code1(i) < code2(i) )
      result = -1;
      return
    elseif ( code2(i) < code1(i) )
      result = +1;
      return
    end

  end

  return
end

