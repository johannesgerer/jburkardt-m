function [ J, grad ] = cost_function ( x, e_conn, u, q, M, lam, c )

%*****************************************************************************80
%
%% COST_FUNCTION evaluate the cost function and its gradient.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Parameters:
%
%    Input, real X(N_NODES,1), the nodes of the mesh.
%
%    Input, integer E_CONN(N_ELEMENTS,NEL_DOF),
%
%    Input, real U(N_NODES), the value of the finite element solution at 
%    each node.
%
%    Input, real Q(N_NODES,1), the value of the control function at
%    each node of the mesh.
%
%    Input, real M(N_NODES,N_NODES), the mass matrix.  
%    M(I,J) = Integral PHI(I) PHI(J).
%
%    Input, real LAM(N_NODES), the value of the adjoint variable at each node.
%
%    Input, real C(N_EQUATIONS), the value of the adjoint equation right hand 
%    side at each internal node.
%
%    Output, real J, the cost function, 1/2 sqrt ( integral ( U - U_HAT )^2 ).
%
%    Output, real GRAD(N_NODES,1), the gradient of the cost function (?).
%
%  Local Parameters:
%
%    Local, real ALPHA, a weighting factor in the computation of GRAD.
%
%    Local, real GRAD_LOCAL(NEL_DOF), the local contribution to the gradient 
%    at the nodes of a given element.
%
%    Local, real LAMX_G(N_GAUSS), the dLAMdX function at the Gauss points 
%    in a given element.
%
%    Local, integer N_ELEMENTS, the number of elements.
%
%    Local, integer N_GAUSS, the number of Gauss points.
%
%    Local, integer N_NODES, the number of nodes.
%
%    Local, integer NEL_DOF, the number of degrees of freedom per element.
%
%    Local, integer NODES_LOCAL, the indices of the nodes in a given element.
%
%    Local, real P_X, the derivative of the basis function evaluated at
%    the Gauss points in a given element.
%
%    Local, real PHI, the basis function evaluated at
%    the Gauss abscissas in a given element.
%
%    Local, real QX_G(N_GAUSS), the value of dQdX at the Gauss points in a 
%    given element.
%
%    Local, real R(N_GAUSS), the Gauss points.
%
%    Local, real UX_G(N_GAUSS), the dUdX function at the Gauss points in a 
%    given element.
%
%    Local, real W(N_GAUSS), the Gauss weights.
%
%    Local, real W_G(N_GAUSS), the Gauss weights mapped to a given element.
%
%    Local, real X_G(N_GAUSS), the Gauss points mapped to a given element.
%
%    Local, real X_LOCAL(NEL_DOF), the nodes in a given element.
%
  [ n_nodes, n_dimensions ] = size ( x );
  [ n_elements, nel_dof ] = size ( e_conn );
  n_gauss = 3;
  [ r, w ] = oned_gauss ( n_gauss );

  J = 0.5 * sqrt ( c' * M(2:end-1,2:end-1) * c );
%  
%  Compute the gradient.
%
  grad = zeros(n_nodes,1);

  alpha = 0.000003;

  for n_el = 1 : n_elements
      
    nodes_local = e_conn(n_el,:);
    x_local = x(nodes_local,:);
    [ x_g, w_g, phi, p_x ] = oned_shape ( x_local, r, w );

    ux_g = p_x * u(nodes_local);
    qx_g = p_x * q(nodes_local);
    lamx_g = p_x * lam(nodes_local);
    
    grad_local = alpha * oned_f_int ( qx_g,           p_x, w_g ) ...
                       - oned_f_int ( lamx_g .* ux_g, phi, w_g );
%
%  Assemble local contribution to gradient.
%
    for n_t = 1 : nel_dof
      n_test = nodes_local(n_t);
      grad(n_test) = grad(n_test) + grad_local(n_t);
    end

  end
  
  return
end
