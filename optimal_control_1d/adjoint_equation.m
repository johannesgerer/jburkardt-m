function [ lam, c ] = adjoint_equation ( x, e_conn, K, u )

%*****************************************************************************80
%
%% ADJOINT_EQUATION sets up and solves the adjoint equation.
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
%    Input, real K(N_NODES,N_NODES), the stiffness matrix.  
%    K(I,J) = Integral Q * PHI'(I) * PHI'(J).
%
%    Input, real U(N_NODES), the solution to the finite element system.
%
%    Output, real LAM(N_NODES), the value of the adjoint variable at each node.
%
%    Output, real C(N_EQUATIONS), the value of the adjoint equation right hand side
%    at each internal node.
%
%  Local Parameters:
%
%    Local, real C_LOC(NEL_DOF), the value of the adjoint variable at the
%    nodes in a given element.
%
%    Local, real DLAM(N_EQUATIONS), the value of the adjoint variable at each internal node.
%
%    Local, integer IDE(N_NODES), indexes internal and boundary nodes.
%    0 < IDE(I) means node I is internal node index IDE(I).
%    IDE(I) < 0 means node I is boundary node index -IDE(I).
%
%    Local, integer N_ELEMENTS, the number of elements.
%
%    Local, integer N_EQUATIONS, the number of finite element equations,
%    that is, the number of internal nodes.
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
%    the Gauss abscissas in a given element.
%
%    Local, real PHI, the basis function evaluated at
%    the Gauss abscissas in a given element.
%
%    Local, real R(N_GAUSS), the Gauss abscissas.
%
%    Local, real U_G(N_GAUSS), the U function at the Gauss points in a given element.
%
%    Local, real U_LOCAL(NEL_DOF), the U function at the nodes of a given element.
%
%    Local, real UHAT_G(N_GAUSS), the U hat function at the Gauss points in a given element.
%
%    Local, real W(N_GAUSS), the Gauss weights.
%
%    Local, real W_G(N_GAUSS), the Gauss weights mapped to a given element.
%
%    Local, real X_G(N_GAUSS), the Gauss points mapped to a given element.
%
%    Local, real X_LOCAL(NEL_DOF), the nodes in a given element.
%
  [ n_nodes, n_dimensions] = size ( x );
  [ n_elements, nel_dof ] = size ( e_conn );
  n_equations = n_nodes - 2;
  n_gauss = 3;

  ide(1) = -1;
  ide(2:n_nodes-1) = 1 : n_equations;
  ide(n_nodes) = -2;
%
%  Determine the right hand side of the adjoint equation.
%
  c = zeros(n_equations,1);

  [ r, w ] = oned_gauss ( n_gauss );

  for n_el = 1 : n_elements
    
    nodes_local = e_conn(n_el,:);
    x_local = x(nodes_local,:);
    [ x_g, w_g, phi, p_x ] = oned_shape ( x_local, r, w );

    u_local = u(nodes_local);
    u_g = phi * u_local;
    uhat_g = u_hat ( x_g );

    c_loc = oned_f_int ( uhat_g - u_g, phi, w_g );

    for n_t = 1 : nel_dof
      n_test = ide(nodes_local(n_t));
      if ( 0 < n_test )
        c(n_test) = c(n_test) + c_loc(n_t);
      end
    end
  end
%
%  Solve the adjoint equation K' * DLAM = C.
%
  dlam = K' \ c;
%
%  The adjoint variable needs to have entries appended for the boundary nodes.
%
  lam = zeros(n_nodes,1);

  for n = 1 : n_nodes
    i = ide(n);
    if ( 0 < i )
      lam(n) = dlam(i);
    else
      lam(n) = 0.0;
    end
  end

  return
end
