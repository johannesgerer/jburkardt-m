function var = ns_t6_var_set ( element_num, element_node, node_num, ...
  var_node, var_num )

%*****************************************************************************80
%
%% NS_T6_VAR_SET sets the Navier Stokes variables on a T6 grid.
%
%  Discussion:
%
%    We are given a mesh of T6 elements, and asked to create the natural
%    list of indices for Navier-Stokes variables associated with each node.
%    In particular, every node has two velocity variables associated with
%    it, but only a node that is a vertex of the element will also have
%    an associated pressure variable.
%
%    The hard work has been done for us alread, because the variables
%    have been counted, and the pointers to the occurrence of the
%    first variable associated with each node have been created.
%
%    The indexing of the nodes can be arbitrary, although a bad
%    indexing will result in a miserably large bandwidth (if band
%    storage is being tried for the stiffness matrix).  Here, we
%    simply try to natural ordering, that is, the variables are
%    numbered in order of the node with which they are associated.
%
%    For the Navier Stokes problem on a T6 grid, we take it as
%    understood that each node has either 2 or 3 variables associated
%    with it, that the first two are always the horizontal and
%    then vertical velocity coefficients, and that the third, if
%    present, is a pressure coefficient.
%
%    In other settings, it might be necessary not merely to assign
%    the variables an index, but also to identify them as to type.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer VAR_NODE(NODE_NUM+1), used to find the variables
%    associated with a given node, which are in VAR in locations
%    VAR_NODE(NODE) to VAR_NODE(NODE+1)-1.  Note that the last entry of
%    this array points to the location just after the last location in VAR.
%
%    Input, integer VAR_NUM, the number of variables.
%
%    Output, integer VAR(VAR_NUM), the indexes of the variables, which
%    are simply 1, 2, 3, ..., VAR_NUM.
%
  for i = 1 : var_num
    var(i) = i;
  end

  return
end
