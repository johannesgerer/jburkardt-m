function [ var_node, var_num ] = ns_t6_var_count ( element_num, ...
  element_node, node_num )

%*****************************************************************************80
%
%% NS_T6_VAR_COUNT counts the Navier Stokes variables on a T6 grid.
%
%  Discussion:
%
%    We are given a mesh of T6 elements, and asked to count, in advance,
%    the number of Navier-Stokes variables associated with the grid.
%    In particular, every node has two velocity variables associated with
%    it, but only a node that is a vertex of the element will also have
%    an associated pressure variable.
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
%    Output, integer VAR_NODE(NODE_NUM+1), used to find the variables
%    associated with a given node, which are in VAR in locations
%    VAR_NODE(NODE) to VAR_NODE(NODE+1)-1.  Note that the last entry of
%    this array points to the location just after the last location in VAR.
%
%    Output, integer VAR_NUM, the number of variables.
%
  element_order = 6;
%
%  Our job is easy once we determine which nodes are vertices.
%  So to begin with, let VAR_NODE count the number of variables
%  associated with each node.
%
  var_node(1:node_num) = 2;

  for element = 1 : element_num
    for order = 1 : 3
      node = element_node(order,element);
      var_node(node) = 3;
    end
  end
%
%  Count them.
%
  var_num = sum ( var_node(1:node_num) );
%
%  Make pointers.
%
  total = 1;

  for node = 1 : node_num
    num = var_node(node);
    var_node(node) = total;
    total = total + num;
  end
  var_node(node_num+1) = total;

  return
end
