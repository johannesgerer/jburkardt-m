function u = fem1d_heat_implicit ( x_num, x, t, dt, k_fun, ...
  rhs_fun, bc_fun, element_num, element_node, quad_num, u_old )

%*****************************************************************************80
%
%% FEM1D_HEAT_IMPLICIT: finite element method, 1D heat, implicit time steps.
%
%  Discussion:
%
%    This program solves
%
%      dUdT - k * d2UdX2 = f(X,T)
%
%    over the interval [A,B] with boundary conditions
%
%      U(A,T) = UA(T),
%      U(B,T) = UB(T),
%
%    over the time interval [T0,T1] with initial conditions
%
%      U(X,T0) = U0(X)
%
%    and specified functions k(X,T) and f(X,T).
%
%    The code uses the finite element method to approximate the second derivative 
%    in space, and an implicit backward Euler approximation to the first 
%    derivative in time.
%
%    For a test function Vi, we write
%
%      dUdt Vi - k * d2Udx2 * Vi = f(x,t) * Vi
%
%      Int dUdt Vi - k d2Udx2 * Vi    = Int f(x,t) Vi
%      Int dUdt Vi + k dUdx   * dVidx = Int f(x,t) Vi
%
%    Take the backward Euler approximation to the derivative:
%
%      Int ( U(x,t) - U(x,t-dt) ) / dt Vi + k dUdx dVidx = Int ( f(x,t) Vi )
%
%    Now, assume the finite element projection:
%
%      U(x,t)    = sum ( uj     * Vj )
%      U(x,t-dt) = sum ( u_oldj * Vj )
%      F(x,t)    = sum ( fj     * Vj ):
%
%    Then the equation can be rewritten as:
%
%      Sum ( Int ( Vi Vj ) * ( uj - u_oldj ) / dt + k dVidx dVjdx * uj ) =
%        Sum ( Int ( Vi Vj * fj ) )
%
%    Carrying the old U to the right hand side, we have:
%
%      Sum ( Int ( Vi Vj ) * u / dt + k dVidx dVjdx * uj ) =
%        Sum ( Int ( Vi Vj * ( fj + u_oldj / dt ) ) )
%
%    or, written as a linear system for coefficients "u":
%
%      ( K + M/dT ) * u = b + c
%
%    where K is the usual stiffness matrix, M is the standard finite element
%    mass matrix, b is the usual right hand side, and c contains additions to 
%    the right hand side from the time term.
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
%    Input, real U_OLD(X_NUM,1), the solution at time T - dt.
%
%    Output, real U(X_NUM,1), the solution at time T.
%
  [ a, b ] = assemble_fem ( x_num, x, element_num, element_node, ...
    quad_num, t, k_fun, rhs_fun );

  [ a, b ] = assemble_backward_euler ( x_num, x, element_num, ...
    element_node, quad_num, t, dt, u_old, a, b );

  [ a, b ] = assemble_bc ( x_num, x, t, bc_fun, a, b );

  u = a \ b;

  return
end
