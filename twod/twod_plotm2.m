function twod_plotm2(n_fig,x,e_conn,symbol)
%-----------------------------------------------------------------------
%  twod_plotm2.m - Plots linear triagular mesh
%                  (also works for quadratic straight sided elements)
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = twod_plotm2(n_fig,x,e_conn,symbol)
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
%  See twod_plotm1 for linear elements
%-----------------------------------------------------------------------
  figure(n_fig)
  hold on
  [n_elems,ndof] = size(e_conn);
  
  if (ndof==6)
    for i=1:n_elems
      plot([x(e_conn(i,1),1), x(e_conn(i,4),1), x(e_conn(i,2),1),...
            x(e_conn(i,5),1), x(e_conn(i,3),1), x(e_conn(i,6),1),...
            x(e_conn(i,1),1)],...
           [x(e_conn(i,1),2), x(e_conn(i,4),2), x(e_conn(i,2),2),...
            x(e_conn(i,5),2), x(e_conn(i,3),2), x(e_conn(i,6),2),...
            x(e_conn(i,1),2)],'k')
    end
  elseif(ndof==3)
    for i=1:n_elems
      plot([x(e_conn(i,1),1), x(e_conn(i,2),1), ...
            x(e_conn(i,3),1), x(e_conn(i,1),1)],...
           [x(e_conn(i,1),2), x(e_conn(i,2),2), ...
            x(e_conn(i,3),2), x(e_conn(i,1),2)],'k')
    end
  end
      
  axis off;
  axis equal;

  if (nargin==4)
    n_nodes = max( size(x) );
    for i=1:n_nodes
      plot(x(i,1),x(i,2),symbol)
    end
  end
