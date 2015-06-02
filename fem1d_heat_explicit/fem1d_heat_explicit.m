function u_new = fem1d_heat_explicit ( x_num, x, t, dt, k_fun, ...
  rhs_fun, bc_fun, element_num, element_node, quad_num, mass, u )

%*****************************************************************************80
%
%% FEM1D_HEAT_EXPLICIT: finite element method, 1D heat, explicit time steps.
%
%  Discussion:
%
%    This program solves
%
%      dUdT - k * d2UdX2 = f(X,T)
%
%    over the space interval [A,B], with boundary conditions
%
%      U(A,T) = UA(T),
%      U(B,T) = UB(T),
%
%    and over the time interval [T0,T1], with initial conditions
%
%      U(X,T0) = U0(X)
%
%    and specified functions k(X,T) and f(X,T).
%
%    The code uses the finite element method to approximate the
%    second derivative in space, and an explicit forward Euler approximation
%    to the first derivative in time.
%
%    For a test function Vi, we write
%
%      dUdt Vi = k * d2Udx2 * Vi + f(x,t) * Vi
%
%      Int dUdt Vi = Int   k * d2Udx2 * Vi    + f(x,t) * Vi
%                  = Int - k * dUdx   * dVidx + f(x,t) * Vi
%
%    Take the forward Euler approximation to the derivative:
%
%      Int ( U(x,t+dt) - U(x,t) ) / dt * Vi = Int ( - k * dUdx * dVidx + f(x,t) * Vi )
%
%    Now, assume the finite element projection:
%
%      U(x,t)    = sum ( uj     * Vj )
%      U(x,t+dt) = sum ( u_newj * Vj )
%      F(x,t)    = sum ( fj     * Vj ):
%
%    Then the equation can be rewritten as:
%
%      Sum ( Int ( Vi Vj ) * ( u_newj - uj ) / dt ) = 
%                          Sum ( Int ( - k * dVidx dVjdx uj + Vi * Vj * fj ) )
%
%    and the collection of equations for all the Vi in our basis becomes:
%
%      M * ( dudt ) = ( - K * u + b )
%      u_new = u + dt * dudt
%
%    or, symbolically, as:
%
%      u_new = u + dt * inverse ( M ) * ( - K * u + b )
%
%    Here "M" is the standard finite element mass matrix, "K" is the standard 
%    finite element stiffness matrix, and "b" the standard finite element right 
%    hand side.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of points to use in the spatial dimension.
%
%    Input, real X(X_NUM,1), the coordinates of the nodes.
%
%    Input, real T, the current time.
%
%    Input, real DT, the size of the time step.
%
%    Input, real K_FUN(), a function to evaluate the heat conductivity.
%
%    Input, real RHS_FUN(), a function to evaluate the right hand side.
%
%    Input, real BC_FUN(), a function to set the Dirichlet conditions.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(2,ELEMENT_NUM), the nodes belonging to 
%    each element.
%
%    Input, integer QUAD_NUM, the number of quadrature points to use.
%
%    Input, sparse real MASS(NODE_NUM,NODE_NUM), the mass matrix.
%
%    Input, real U(X_NUM,1), the solution at time T.
%
%    Output, real U_NEW(X_NUM,1), the solution at time T + dT.
%

%
%  Check stability condition.
%
  k_vec = k_fun ( x_num, x, t );
  cfl = fem1d_heat_explicit_cfl ( x_num, k_vec, x, dt );
%
%  Compute the spatial finite element information.
%
  [ a, b ] = assemble_fem ( x_num, x, element_num, element_node, ...
    quad_num, t, k_fun, rhs_fun );
%
%  MASS * dudt = - A * u + b
%
  dudt(1:x_num,1) = mass \ ( - a * u(1:x_num,1) + b(1:x_num,1) );

  u_new(1:x_num,1) = u(1:x_num,1) + dt * dudt;
%
%  Impose boundary conditions.
%
  u_new(1:x_num,1) = bc_fun ( x_num, x, t + dt, u_new(1:x_num,1) );

  return
end
