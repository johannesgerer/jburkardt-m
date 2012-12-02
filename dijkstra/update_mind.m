function mind = update_mind ( nv, mv, connected, ohd, mind )

%*****************************************************************************80
%
%% UPDATE_MIND updates the minimum distance vector.
%
%  Discussion:
%
%    We've just determined the minimum distance to node MV.
%
%    For each node I which is not connected yet,
%    check whether the route from node 1 to MV to I is shorter
%    than the currently known minimum distance.
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
%    Input, integer MV, the node whose minimum distance to node 1
%    has just been determined.
%
%    Input, integer CONNECTED(NV), is 1 for each connected node, whose 
%    minimum distance to node 1 has been determined.
%
%    Input, integer OHD(NV)(NV), the distance of the direct link between
%    nodes I and J.
%
%    Input, integer MIND(NV), the currently computed minimum distances
%    from node 1 to each node.
%
%    Output, integer MIND(NV), the currently computed minimum distances
%    from node 1 to each node.
%
  for i = 1 : nv
    if ( ~connected(i) )
      if ( ohd(mv,i) < Inf )
        mind(i) = min ( mind(i), mind(mv) + ohd(mv,i) );
      end
    end
  end

  return;
end
