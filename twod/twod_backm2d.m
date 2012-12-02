function [] = twod_backm2d(x,e_conn,node,eta,e_error,e_error2,e_error3)
%-----------------------------------------------------------------------
%  twod_backm2d.m - Calculates a mesh density function and generates
%                   a backm2d file readable by amiral
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = twod_backm2d(x,e_conn,e_error,eta)
%
%  Variables:     x
%                        Nodal coordinates
%                 e_conn
%                        Element connectivity
%                 node
%                        a structure containing an element list for
%                        each node
%                 eta
%                        target error reduction
%                 e_error*
%                        H1-seminorm of the solution error on each
%                        element (computed via error estimation)
%-----------------------------------------------------------------------
  tailmin = 0.00001;   % smallest element size
  tailmax = 0.1;       % largest element size

  [n_nodes   , n_dimensions] = size(x     );
  [n_elements, nel_dof     ] = size(e_conn);

  e_total = sqrt( e_error'*e_error );

  cc      = sqrt( eta*e_total/sqrt(n_elements) );   % p=2

  for n=1:n_elements
    nodes_local = e_conn(n,:);
    x_local     = x(nodes_local,:);

    h = max( [norm( x_local(1,:)-x_local(2,:) ), ...
              norm( x_local(1,:)-x_local(3,:) ), ...
              norm( x_local(2,:)-x_local(3,:) )] );

    delta(n) = h*cc / sqrt( e_error(n) );
  end

  % calculate a mesh density at each node (average of element density
  % in the patch)
  d = zeros(n_nodes,1);
  for n=1:n_nodes
    if (~isempty(node(n).e_list))
      N    = length(node(n).e_list);
      d(n) = sum(delta(node(n).e_list))/N;
    end
  end

  % set a largest and smallest element density
  d = max(d,tailmin);
  d = min(d,tailmax);

  % condense a quadratic mesh to a linear one
  % renumber vertices
  kount = 0; temp = zeros(n_nodes,1);
  for el=1:n_elements
    n1 = e_conn(el,1);  n2 = e_conn(el,2);  n3 = e_conn(el,3);
    if ( temp(n1)==0 ) % we haven't visited this node, assign a new number
      kount       = kount + 1;
      temp(n1)    = kount;
      xl(kount,:) = x(n1,:);
      dl(kount)   = d(n1);
    end
    if ( temp(n2)==0 )
      kount       = kount + 1;
      temp(n2)    = kount;
      xl(kount,:) = x(n2,:);
      dl(kount)   = d(n2);
    end
    if ( temp(n3)==0 )
      kount       = kount + 1;
      temp(n3)    = kount;
      xl(kount,:) = x(n3,:);
      dl(kount)   = d(n3);
    end

    % define the connectivity in the new node numbering scheme
    e_connl(el,:) = [ temp(n1) temp(n2) temp(n3) ];
  end

  % write a backm2d file
  fid = fopen('control01.backm2d','w');
  % Write out numbers of nodes and elements for background mesh
  [n_nodesl   , n_dimensions] = size(xl     );
  [n_elementsl, nel_dof     ] = size(e_connl);
  
  fprintf(fid,'     %7i     %7i\n',n_nodesl,n_elementsl);

  for i=1:n_nodesl
    fprintf(fid,'%6i   %10.6f  %10.6f  %10.6f  %7.4f %7.4f %7.4f\n',...
            i,xl(i,1),xl(i,2),dl(i),1,0,1);
  end

  for n=1:n_elementsl
    fprintf(fid,'     %7i     %7i     %7i     %7i\n',n,e_connl(n,:));
  end

  fclose(fid);
