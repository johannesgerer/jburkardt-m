function [d, e_error] = oned_projectd(x,e_conn,u)

%*****************************************************************************80
%
%  oned_projectd.m - projects the derivative onto the 
%                    continuous finite element space
%                    <this routine simply does a Galerkin projection>
%                    <we should eventually be more clever>
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:    [d, e_error] = oned_projectd(x, e_conn, u)
%
%  Variables:     d
%                        Derivative of the projection evaluated at
%                        the node points
%                 e_error
%                        element error (H1-seminorm)
%
%                 x
%                        nodal coordinates
%                 e_conn  
%                        connectivity for a background mesh
%                 u       
%                        nodal values
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
  u_local           = u(nodes_local);

  [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

  dudx              = p_x*u_local';
  %---------------------------------------------------------------------
  %  Compute the element contributions
  %---------------------------------------------------------------------
  M_loc = oned_bilinear(one , phi, phi, w_g);
  b_loc = oned_f_int   (dudx, phi, w_g);

  %---------------------------------------------------------------------
  %  Assemble contributions into the global system matrix
  %---------------------------------------------------------------------
    M(nodes_local,nodes_local) = M(nodes_local,nodes_local) + M_loc;
    b(nodes_local            ) = b(nodes_local            ) + b_loc;
end

d = M\b;

%-----------------------------------------------------------------------
%  Plot the finite element derivative and its projection (debugging)
%  - only set up for linear elements currently
%-----------------------------------------------------------------------
figure(12)
plot(x,d)

hold on
for n_el=1:n_elements
  nodes_local = e_conn(n_el,:);
  x_local     = x(nodes_local,:);
  u_local     = u(nodes_local);

  x_plot      = linspace( x_local(1,1), x_local(end,1), 10 );
  [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w_g);
  c = p_x*u_local';
  plot(x_g,c,':')
end
pause

%-----------------------------------------------------------------------
%  Calculate the H1-seminorm of the error on each element
%-----------------------------------------------------------------------
e_error = zeros(n_elements,1);

n_gauss = 5;
[r,w]   = oned_gauss(n_gauss);

for n_el=1:n_elements
  nodes_local       = e_conn(n_el,:);
  x_local           = x(nodes_local);
  d_local           = d(nodes_local);
  u_local           = u(nodes_local);

  [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

  d_g               = phi*d_local;
  dudx_g            = p_x*u_local';

  sq_error          = (d_g-dudx_g).*(d_g-dudx_g);
  e_error(n_el)     = sq_error'*w_g;
end

  return
end
