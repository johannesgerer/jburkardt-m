function c = assemble_mass ( node_num, node_x, element_num, element_node, ...
  quad_num )

%*****************************************************************************80
%
%% ASSEMBLE_MASS assembles the finite element mass matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_X(NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(2,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, integer QUAD_NUM, the number of quadrature points used in assembly.
%
%    Output, sparse real C(NODE_NUM,NODE_NUM), the finite element mass matrix.
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
  c = [];
  c = sparse ( node_num, node_num );
%
%  Get the quadrature weights and nodes.
%
  [ reference_w, reference_q ] = quadrature_set ( quad_num );
%
%  Consider each ELEMENT.
%
  for element = 1 : element_num

    element_x(1:2,1) = node_x(element_node(1:2,element));

    element_q(1:quad_num,1) = reference_to_physical ( element, element_node, ...
      node_x, quad_num, reference_q );

    element_area = element_x(2) - element_x(1);

    element_w(1:quad_num,1) = ( element_area / 2.0 ) * reference_w(1:quad_num);
%
%  Consider the QUAD-th quadrature point in the element.
%
    for quad = 1 : quad_num
%
%  Consider the TEST-th test function.
%
%  We generate an integral for every node associated with an unknown.
%
      for i = 1 : 2

        test = element_node(i,element);

        [ bi, dbidx ] = basis_function ( test, element, node_x, 1, element_q(quad) );
%
%  Consider the BASIS-th basis function, which is used to form the
%  value of the solution function.
%
        for j = 1 : 2

          basis = element_node(j,element);

          [ bj, dbjdx ] = basis_function ( basis, element, node_x, 1, element_q(quad) );

          c(test,basis) = c(test,basis) + element_w(quad) * bi * bj;

        end

      end

    end

  end

  return
end
