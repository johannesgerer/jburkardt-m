function a = mass_matrix_t6 ( node_num, element_num, element_node, x, y )

%*****************************************************************************80
%
%% MASS_MATRIX_T6 computes the mass matrix, using 6-node triangles.
%
%  Discussion:
%
%    The mass matrix to be estimated has the form:
%
%      A(I,J) = integral ( PHI(I)(X,Y) * PHI(J)(X,Y) ) d Region
%
%    where PHI(I) and PHI(J) are the shape functions associated with
%    the I-th and J-th variables.
%
%  Referene Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(6,ELEMENT_NUM), the nodes that make
%    up each element.
%
%    Input, real X(NODE_NUM), Y(NODE_NUM), the coordinates
%    of the nodes.
%
%    Output, real A(NODE_NUM,NODE_NUM), the mass matrix.
%
  element_order = 6;
%
%  Zero out the matrix.
%
  a(1:node_num,1:node_num) = 0.0;
%
%  Get the weights and abscissas for a unit triangle.
%
  rule = 12;
  quad_num = triangle_unit_size ( rule );
  [ rtab, stab, weight ] = triangle_unit_set ( rule );
%
%  For each element.
%
  for element = 1 : element_num

    p1 = element_node(1,element);
    p2 = element_node(2,element);
    p3 = element_node(3,element);

    area = 0.5 * abs ( ...
        x(p1) * ( y(p2) - y(p3) ) ...
      + x(p2) * ( y(p3) - y(p1) ) ...
      + x(p3) * ( y(p1) - y(p2) ) );

    if ( area == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MASS_MATRIX_T6 - Fatal error!\n' );
      fprintf ( 1, '  Zero area for element %d\n', element );
      error ( 'MASS_MATRIX_T6 - Fatal error!' );
    end
%
%  For each quadrature point in the element...
%
    for quad = 1 : quad_num

      r = rtab(iquad);
      s = stab(iquad);

      [ w, dwdr, dwds ] = shape_t6 ( r, s );
%
%  For each basis function PHI(I) associated with a node in the element,
%
      for iq = 1 : element_order

        ip = element_node(iq,element);
%
%  For each "neighbor" basis function PHI(J) associated with a node in
%  the element.
%
        for jq = 1 : element_order

          jp = element_node(jq,element);

          a(ip,jp) = a(ip,jp) + area * weight(iquad) * w(iq) * w(jq);

        end
      end
    end
  end

  return
end
