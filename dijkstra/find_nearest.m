function [ d, v ] = find_nearest ( nv, mind, connected )

%*****************************************************************************80
%
%% FIND_NEAREST finds the nearest unconnected node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer NV, the number of nodes.
%
%    Input, integer MIND(NV), the currently computed minimum distance from
%    node 1 to each node.
%
%    Input, integer CONNECTED(NV), is 1 for each connected node, whose 
%    minimum distance to node 1 has been determined.
%
%    Output, integer D, the distance from node 1 to the nearest 
%    unconnected node.
%
%    Output, integer V, the index of the nearest unconnected node.
%
  d = Inf; 
  v = -1;
  for i = 1 : nv
    if ( ~connected(i) && mind(i) < d )
      d = mind(i);
      v = i;
    end
  end
  return;
end
