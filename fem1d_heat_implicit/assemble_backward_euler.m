function [ a, b ] = assemble_backward_euler ( x_num, x, element_num, ...
  element_node, quad_num, t, dt, u_old, a, b )

%*****************************************************************************80
%
%% ASSEMBLE_BACKWARD_EULER adjusts the system for the backward Euler term.
%
%  Discussion:
%
%    The input linear system
%
%      A * U = F
%
%    is appropriate for the equation
%
%      -Uxx - Uyy - K * U = RHS
%
%    We need to modify the matrix A and the right hand side F to
%    account for the approximation of the time derivative in
%
%      Ut - Uxx - Uyy - K * U = RHS
%
%    by the backward Euler approximation:
%
%      Ut approximately equal to ( U - Uold ) / dT
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
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_ORDER, the number of nodes used to form one element.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, integer IB, the half-bandwidth of the matrix.
%
%    Input, real T, the current time.
%
%    Input, real TIME_STEP_SIZE, the size of the time step.
%
%    Input, real U_OLD(NODE_NUM), the finite element
%    coefficients for the solution at the previous time.
%
%    Input, sparse real A(X_NUM,X_NUM), the matrix.
%
%    Input, real B(X_NUM), the right hand side.
%
%    Output, sparse real A(X_NUM,X_NUM), the updated matrix.
%
%    Output, real B(X_NUM), the updated right hand side.
%

%
%  Get the quadrature rule weights and nodes.
%
  [ reference_w, reference_q ] = quadrature_set ( quad_num );
%
%  Consider each ELEMENT.
%
  for element = 1 : element_num

    element_x(1:2,1) = x(element_node(1:2,element));

    element_q(1:quad_num,1) = reference_to_physical ( element, element_node, ...
      x, quad_num, reference_q );

    element_area = element_x(2) - element_x(1);

    element_w(1:quad_num,1) = ( element_area / 2.0 ) * reference_w(1:quad_num);
%
%  Consider the QUAD-th quadrature point in the element.
%
    for quad = 1 : quad_num
%
%  Consider the TEST-th test function.
%
      for i = 1 : 2

        test = element_node(i,element);

        [ bi, dbidx ] = basis_function ( test, element, x, 1, element_q(quad) );
%
%  Carry the U_OLD term to the right hand side.
%
        b(test) = b(test) + element_w(quad) * bi * u_old(test) / dt;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
%  Modify the diagonal entries of A.
%
        for j = 1 : 2

          basis = element_node(j,element);

          [ bj, dbjdx ] = basis_function ( basis, element, x, 1, element_q(quad) );

          a(test,basis) = a(test,basis) + element_w(quad) * bi * bj / dt;

        end
      end

    end

  end

  return
end
