function [ u, M, K ] = finite_element ( x, e_conn, q )

%*****************************************************************************80
%
%% FINITE_ELEMENT solves the finite element system.
%
%  Discussion:
%
%    The finite element system has the form:
%
%      d/dx ( q(x) * du(x)/dx ) = f(x)
%      u(a) = 0
%      u(b) = 0
%
%    where
%
%      q(x) is a given control function,
%      f(x) is a given right hand side function.
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
%    Input, real Q(N_NODES,1), the value of the control function at
%    each node of the mesh.
%
%    Output, real U(N_NODES), the finite element function at each node.
%
%    Output, real M(N_NODES,N_NODES), the mass matrix.  
%    M(I,J) = Integral PHI(I) PHI(J).
%
%    Output, real K(N_NODES,N_NODES), the stiffness matrix.  
%    K(I,J) = Integral Q * PHI'(I) * PHI'(J).
%
%  Local Parameters:
%
%    Local, real B(N_EQUATIONS), the right hand side of the finite element 
%    system, Integral F PHI(I).
%
%    Local, real B_LOCAL(NEL_DOF), the contribution to Integral F PHI(I) 
%    at the nodes in a given element.
%
%    Local, real DU(N_EQUATIONS), the value of U at the internal nodes.
%
%    Local, real F_G(N_GAUSS), the value of the right hand side function 
%    at the Gauss points in a given element.
%
%    Local, integer IDE(N_NODES), indexes internal and boundary nodes.
%    0 < IDE(I) means node I is internal node index IDE(I).
%    IDE(I) < 0 means node I is boundary node index -IDE(I).
%
%    Local, real K_LOCAL(NEL_DOF,NEL_DOF), the local stiffness matrix.
%
%    Local, real M_LOCAL(NEL_DOF,NEL_DOF), the local mass matrix.
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
%    the Gauss points in a given element.
%
%    Local, real PHI, the basis function evaluated at
%    the Gauss abscissas in a given element.
%
%    Local, real Q_G(N_GAUSS), the value of Q at the Gauss points in a 
%    given element.
%
%    Local, real Q_LOCAL(NEL_DOF), the value of Q at the nodes in a 
%    given element.
%
%    Local, real R(N_GAUSS), the Gauss points.
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

  ide(1) = -1;
  ide(2:n_nodes-1) = 1 : n_equations;
  ide(n_nodes) = -2;
 
  n_gauss = 3;
%
%  Build the finite element matrices
%
  M = sparse(n_nodes,n_nodes);
  K = sparse(n_equations,n_equations);
  b = zeros (n_equations,1);

  [ r, w ] = oned_gauss ( n_gauss );

  o_g = ones ( size ( r ) );
  
  for n_el = 1 : n_elements
%
%  Get the local nodes.
%
    nodes_local = e_conn(n_el,:);
    x_local = x(nodes_local,:);
%
%  Map the Gauss points and weights to the element.
%  Evaluate the basis function and its derivative at the Gauss points.
%
    [ x_g, w_g, phi, p_x ] = oned_shape ( x_local, r, w );
%
%  Contribute to the mass matrix.
%
    M_local = oned_bilinear ( o_g, phi, phi, w_g );
    M(nodes_local,nodes_local) = M(nodes_local,nodes_local) + M_local;
%
%  Contribute to the stiffness matrix.
%
    q_local = q(nodes_local);
    q_g = phi * q_local;
    K_local = - oned_bilinear ( q_g, p_x, p_x, w_g );
    for n_t = 1 : nel_dof
      n_test = ide(nodes_local(n_t));
      if ( 0 < n_test )
        for n_u = 1 : nel_dof
          n_unk = ide(nodes_local(n_u));
          if ( 0 < n_unk )
            K(n_test,n_unk) = K(n_test,n_unk) + K_local(n_t,n_u);
          end
        end
      end
    end
%
%  Contribute to the right hand side.
%
    f_g = f_function ( x_g );
    b_local = oned_f_int ( f_g, phi, w_g );
    for n_t = 1 : nel_dof
      n_test = ide(nodes_local(n_t));
      if ( 0 < n_test )
        b(n_test) = b(n_test) + b_local(n_t);
      end
    end

  end
%
%  Solve the system at the internal nodes.
%
  du = K \ b;
%
%  Combine the internal values and boundary values to get U.
%
  u = zeros (n_nodes,1);
  for n = 1 : n_nodes
    i = ide(n);
    if ( 0 < i )
      u(n) = du(i);
    else
      u(n) = 0.0;
    end
  end
  
  return
end

