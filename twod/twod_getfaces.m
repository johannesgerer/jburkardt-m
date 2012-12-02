function [elements,faces] = twod_getfaces( e_conn, index )
%-----------------------------------------------------------------------
%  twod_getfaces.m - routine to find element faces corresponding to
%                    a set of boundary nodes
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [elements,faces] = twod_getfaces( e_conn, index )
%
%  Variables:     e_conn
%                        element connectivity
%
%                 index
%                        indices corresponding to boundary nodes
%
%                 elements
%                        element numbers containing boundary nodes
%
%                 faces
%                        corresponding element faces (1, 2 or 3 in 2D)
%-----------------------------------------------------------------------
  [n_elements,nel_dof] = size(e_conn);

  elements = []; faces = [];
  for i=1:length(index)
    node = index(i);
    % determine which elements (if any) contain vertices on the boundary
    % segment
    e_list = [];
    for n=1:n_elements
      if ( e_conn(n,1)==node | e_conn(n,2)==node | e_conn(n,3)==node )
        e_list = [e_list, n]; 
      end
    end

    for n=1:length(e_list)
      el = e_list(n);
      for j=1:length(index)
        node2 = index(j);
        if ( e_conn(el,1)==node & e_conn(el,2)==node2 )
          elements = [ elements, el ];
          faces    = [ faces   ,  1 ];
        end
        if ( e_conn(el,2)==node & e_conn(el,3)==node2 )
          elements = [ elements, el ];
          faces    = [ faces   ,  2 ];
        end
        if ( e_conn(el,3)==node & e_conn(el,1)==node2 )
          elements = [ elements, el ];
          faces    = [ faces   ,  3 ];
        end
      end
    end
  end


%  code to test this routine (if coordinates, x, are passed in)
% figure(14)
% hold on
% for n=1:length(elements)
%   el = elements(n);
%   if ( faces(n)==1 )
%     plot( [x(e_conn(el,1),1) x(e_conn(el,2),1)], ...
%           [x(e_conn(el,1),2) x(e_conn(el,2),2)],'r')
%   elseif ( faces(n)==2 )
%     plot( [x(e_conn(el,2),1) x(e_conn(el,3),1)], ...
%           [x(e_conn(el,2),2) x(e_conn(el,3),2)],'r')
%   else
%     plot( [x(e_conn(el,3),1) x(e_conn(el,1),1)], ...
%           [x(e_conn(el,3),2) x(e_conn(el,1),2)],'r')
%   end
% end


