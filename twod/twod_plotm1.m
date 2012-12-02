function twod_plotm1(n_fig,x,e_conn,symbol)
%-----------------------------------------------------------------------
%  twod_plotm1.m - Plots linear triagular mesh
%                  (also works for quadratic straight sided elements)
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0 
%
%  Usage:    [] = twod_plotm1(n_fig,x,e_conn,symbol)
%
%  Variables:     n_fig
%                        Makes figure n_fig active
%                 x
%                        Nodal coordinates
%                 e_conn
%                        Element connectivity
%                 symbol
%                        (optional) symbol for the nodes
%
%  See twod_plotm2 for quadratic elements
%-----------------------------------------------------------------------
  figure(n_fig)
  hold on
  [n_elems,ndof] = size(e_conn);
  for i=1:n_elems
    plot([x(e_conn(i,1),1), x(e_conn(i,2),1), x(e_conn(i,3),1),...
          x(e_conn(i,1),1)],...
         [x(e_conn(i,1),2), x(e_conn(i,2),2), x(e_conn(i,3),2),...
          x(e_conn(i,1),2)],'k')
  end
      
  axis off;
  axis equal;

  if (nargin==4)
    n_nodes = max( size(x) );
    for i=1:n_nodes
      plot(x(i,1),x(i,2),symbol)
    end
  end
