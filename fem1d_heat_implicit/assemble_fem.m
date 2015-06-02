function [ a, b ] = assemble_fem ( x_num, x, element_num, element_node, ...
  quad_num, t, k_fun, rhs_fun )

%*****************************************************************************80
%
%% ASSEMBLE_FEM assembles the finite element stiffness matrix.
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
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(X_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(2,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Input, real T, the current time.
%
%    Input, real K_FUN(), a function to evaluate the heat conductivity.
%
%    Input, real RHS_FUN(), a function to evaluate the right hand side.
%
%    Output, sparse real A(X_NUM,X_NUM), the finite element stiffness matrix.
%
%    Output, real B(X_NUM), the right hand side.
%
%  Local parameters:
%
%    Local, real BI, DBIDX, the value of some basis function
%    and its first derivative at a quadrature point.
%
%    Local, real BJ, DBJDX, the value of another basis
%    function and its first derivative at a quadrature point.
%

%
%  Initialize the arrays.
%
  b = zeros ( x_num, 1 );
  a = sparse ( x_num, x_num );
%
%  Get the quadrature weights and nodes.
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
    k_value = k_fun ( quad_num, element_q, t );
    rhs_value = rhs_fun ( quad_num, element_q, t );

    for quad = 1 : quad_num
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%
      for i = 1 : 2

        test = element_node(i,element);

        [ bi, dbidx ] = basis_function ( test, element, x, 1, element_q(quad) );

        b(test) = b(test) + element_w(quad) * rhs_value(quad) * bi;
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for j = 1 : 2

          basis = element_node(j,element);

          [ bj, dbjdx ] = basis_function ( basis, element, x, 1, element_q(quad) );

          a(test,basis) = a(test,basis) + element_w(quad) * ( ...
            k_value(quad) * dbidx * dbjdx );

        end

      end

    end

  end

  return
end
