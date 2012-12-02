function [ ml, mu, m ] =  bandwidth_var ( element_order, element_num, ...
  element_node, node_num, var_node, var_num, var )

%*****************************************************************************80
%
%% BANDWIDTH_VAR determines the bandwidth for finite element variables.
%
%  Discussion:
%
%    We assume that, attached to each node in the finite element mesh
%    there are a (possibly zero) number of finite element variables.
%    We wish to determine the bandwidth necessary to store the stiffness
%    matrix associated with these variables.
%
%    An entry K(I,J) of the stiffness matrix must be zero unless the
%    variables I and J correspond to nodes N(I) and N(J) which are
%    common to some element.
%
%    In order to determine the bandwidth of the stiffness matrix, we
%    essentially seek a nonzero entry K(I,J) for which abs ( I - J )
%    is maximized.
%
%    The bandwidth M is defined in terms of the lower and upper bandwidths:
%
%      M = ML + 1 + MU
%
%    where
%
%      ML = maximum distance from any diagonal entry to a nonzero
%      entry in the same row, but earlier column,
%
%      MU = maximum distance from any diagonal entry to a nonzero
%      entry in the same row, but later column.
%
%    We assume the finite element variable adjacency relationship is
%    symmetric, so we are guaranteed that ML = MU.
%
%    Note that the user is free to number the variables in any way
%    whatsoever, and to associate variables to nodes in any way,
%    so that some nodes have no variables, some have one, and some
%    have several.
%
%    The storage of the indices of the variables is fairly simple.
%    In VAR, simply list all the variables associated with node 1,
%    then all those associated with node 2, and so on.  Then set up
%    the pointer array VAR_NODE so that we can jump to the section of
%    VAR where the list begins for any particular node.
%
%    The routine does not check that each variable is only associated
%    with a single node.  This would normally be the case in a finite
%    element setting.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
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
%    Input, integer VAR(VAR_NUM), the indexes of the variables, which
%    are presumably (but not necessarily) 1, 2, 3, ..., VAR_NUM.
%
%    Output, integer ML, MU, the lower and upper bandwidths of the matrix.
%
%    Output, integer M, the bandwidth of the matrix.
%
  ml = 0;
  mu = 0;

  for element = 1 : element_num

    for node_local_i = 1 : element_order
      node_global_i = element_node(node_local_i,element);

      for var_local_i = var_node(node_global_i) : var_node(node_global_i+1)-1
        var_global_i = var(var_local_i);

        for node_local_j = 1 : element_order
          node_global_j = element_node(node_local_j,element);

          for var_local_j = var_node(node_global_j) : var_node(node_global_j+1)-1
            var_global_j = var(var_local_j);

            mu = max ( mu, var_global_j - var_global_i );
            ml = max ( ml, var_global_i - var_global_j );

          end
        end
      end
    end
  end

  m = ml + 1 + mu;

  return
end
