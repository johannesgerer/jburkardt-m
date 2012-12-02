function [ ml, mu, m ] = bandwidth ( element_order, element_num, element_node )

%*****************************************************************************80
%
%% BANDWIDTH determines the bandwidth associated with the finite element mesh.
%
%  Discussion:
%
%    The quantity computed here is the "geometric" bandwidth determined
%    by the finite element mesh alone.
%
%    If a single finite element variable is associated with each node
%    of the mesh, and if the nodes and variables are numbered in the
%    same way, then the geometric bandwidth is the same as the bandwidth
%    of a typical finite element matrix.
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
%    Because the finite element node adjacency relationship is symmetric,
%    we are guaranteed that ML = MU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2006
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
%    Output, integer ML, MU, the lower and upper bandwidths of the matrix.
%
%    Output, integer M, the bandwidth of the matrix.
%
  ml = 0;
  mu = 0;

  for element = 1 : element_num

    for local_i = 1 : element_order
      global_i = element_node(local_i,element);

      for local_j = 1 : element_order
        global_j = element_node(local_j,element);

        mu = max ( mu, global_j - global_i );
        ml = max ( ml, global_i - global_j );

      end
    end
  end

  m = ml + 1 + mu;

  return
end
