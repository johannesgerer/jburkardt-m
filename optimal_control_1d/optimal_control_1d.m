function [ J, grad, u ] = optimal_control_1d ( x, e_conn, q )

%*****************************************************************************80
%
%% OPTIMAL_CONTROL_1D evaluates an optimal control problem given a control.
%
%  Discussion:
%
%    Given a finite element mesh, right hand side function f(x), and control
%    function q(x), this function solves the finite element system
%
%      - d/dx ( q(x) * du(x)/dx ) = f(x)
%      u(0) = 0
%      u(1) = 0
%
%    and returns the cost function and gradient associated with the optimal
%    control problem of minimizing the cost functional J(u,q):
%
%      J(u,q) = 1/2 sqrt ( integral ( u(x) - u_hat(x) )^2 dx )
%         + alpha * sqrt ( integral ( q(x)            )^2 dx )
%
%    given a target function u_hat(x) and cost-of-control weight alpha.
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
%    Output, real J, the cost function, 1/2 sqrt ( integral ( U - U_HAT )^2 ).
%
%    Output, real GRAD(N_NODES,1), the gradient of the cost function.
%
%    Output, real U(N_NODES), the value of the solution of the finite element
%    system at the nodes.
%
%  Local Parameters:
%
%    Local, real C(N_EQUATIONS), the value of the adjoint equation right hand side
%    at each internal node.
%
%    Local, real K(N_NODES,N_NODES), the stiffness matrix.  
%    K(I,J) = Integral Q * PHI'(I) * PHI'(J).
%
%    Local, real LAM(N_NODES), the value of the adjoint variable at each node.
%
%    Local, real M(N_NODES,N_NODES), the mass matrix.  
%    M(I,J) = Integral PHI(I) PHI(J).
%

%
%  Given Q, set up and solve the finite element system for U.
%
  [ u, M, K ] = finite_element ( x, e_conn, q );
%
%  Given U, set up and solve the adjoint system for LAM.
%
  [ lam, c ] = adjoint_equation ( x, e_conn, K, u );
%
%  Evaluate the cost functional J and its gradient.
%
  [ J, grad ] = cost_function ( x, e_conn, u, q, M, lam, c );

  return
end
