function cpp = subsetconnectivity ( t, p, nds )

%*****************************************************************************80
%
%% SUBSETCONNECTIVITY: connectivity of boundary node subset in a triangulation.
%
%  Licensing:
%
%    Copyright (C) 2014 Marcus R. Garvie. 
%    See 'mycopyright.txt' for details.
%
%  Modified: 
%       
%    29 April 2014
%
%  Author:
%
%    Marcus Garvie
%
%  Parameters:
%
%    Input, real P(NP,2), the coordinates of a set of nodes.
%
%    Input, integer T(NT,3), a list of the nodes which make up each 
%    triangle of a triangulation of the nodes in P.
%
%    Input, integer NDS(NN,1), a list of nodes comprising a subset of the
%    boundary nodes.
%
%    Output, CPP(NE,2), a list of edges, each edge defined by 2 nodes from 
%    the list NDS.
%
  cpp = [];
%
% Work out connectivity for the whole boundary.
%
  edges = boundedges (p,t);
%
%  NO_EDGES = Number of edges in whole boundary.
%
  [no_edges,~] = size(edges);
%
%  NN = Number of nodes in the subset of boundary nodes.
%
  NN = length(nds);
%
%  Find the edges in the subset of the boundary NDS.
%
  count = 0;

  for i = 1:no_edges

    node1 = edges(i,1);
    node2 = edges(i,2);
    bin1 = ismember(node1,nds);
    bin2 = ismember(node2,nds);

    if (bin1==1) & (bin2==1)
      count = count + 1;
      cpp(count,:) = edges(i,:);
    end

  end

  return
end
