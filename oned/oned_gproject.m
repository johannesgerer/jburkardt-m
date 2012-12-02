function [p] = oned_gproject(x,e_conn,u_fname)

%*****************************************************************************80
%
%  oned_gproject.m - perform Galerkin projection of the
%                    incoming function, u_fname.
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:    [p] = oned_gproject(x, e_conn, u_fname)
%
%  Variables:     p
%                        Galerkin projection of u evaluated at
%                        the node points
%
%                 x
%                        nodal coordinates
%                 e_conn  
%                        connectivity for a background mesh
%                 u_fname       
%                        function name to be projected onto U
%-----------------------------------------------------------------------

[n_nodes   , dim    ] = size(x);
[n_elements, nel_dof] = size(e_conn);

%-----------------------------------------------------------------------
%  Integrate projection (mass) matrix
%-----------------------------------------------------------------------
M = sparse(n_nodes,n_nodes);
b = zeros (n_nodes,1      );

n_gauss = 5;
[r,w]   = oned_gauss(n_gauss);
one     = ones(size(r));

for n_el=1:n_elements
  nodes_local       = e_conn(n_el,:);
  x_local           = x(nodes_local);

  [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

  u_g               = feval(u_fname,x_g);
  %---------------------------------------------------------------------
  %  Compute the element contributions
  %---------------------------------------------------------------------
  M_loc = oned_bilinear(one , phi, phi, w_g);
  b_loc = oned_f_int   (u_g , phi,      w_g);

  %---------------------------------------------------------------------
  %  Assemble contributions into the global system matrix
  %---------------------------------------------------------------------
    M(nodes_local,nodes_local) = M(nodes_local,nodes_local) + M_loc;
    b(nodes_local            ) = b(nodes_local            ) + b_loc;
end

p = M\b;

%-----------------------------------------------------------------------
%  Plot the nodal values of the function and its projection (debugging)
%  - only set up for linear elements currently
%-----------------------------------------------------------------------
figure(12)
u = feval(u_fname,x);
plot(x,u,'*',x,p)

  return
end
