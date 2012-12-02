function [ dcdx, dcdy ] = derivative_average_t3 ( node_num, node_xy, ...
  element_num, element_node, c )

%*****************************************************************************80
%
%% DERIVATIVE_AVERAGE_T3 averages derivatives at the nodes of a T3 mesh.
%
%  Discussion:
%
%    This routine can be used to compute an averaged nodal value of any
%    quantity associated with the finite element function.  At a node 
%    that is shared by several elements, the fundamental function
%    U will be continuous, but its spatial derivatives, for instance,
%    will generally be discontinuous.  This routine computes the
%    value of the spatial derivatives in each element, and averages
%    them, to make a reasonable assignment of a nodal value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM), the element->node data.
%
%    Input, real C(NODE_NUM), the finite element coefficient
%    vector.
%
%    Output, real DCDX(NODE_NUM), DCDY(NODE_NUM), the averaged
%    values of dCdX and dCdY at the nodes.
%
  node_count(1:node_num) = 0;
  dcdx(1:node_num) = 0.0;
  dcdy(1:node_num) = 0.0;
%
%  Consider every element.
%
  for element = 1 : element_num
%
%  Get the coordinates of the nodes of the element.
%
    t(1:2,1:3) = node_xy(1:2,element_node(1:3,element));
%
%  Evaluate the X and Y derivatives of the 3 basis functions at the
%  3 nodes.
%
    [ phi, dphidx, dphidy ] = basis_mn_t3 ( t, 3, t );
%
%  Evaluate dCdX and dCdY at each node in the element, and add
%  them to the running totals.
%
    for node_local1 = 1 : 3

      node_global1 = element_node(node_local1,element);

      for node_local2 = 1 : 3

        node_global2 = element_node(node_local2,element);

        dcdx(node_global1) = dcdx(node_global1) ...
          + c(node_global2) * dphidx(node_local2,node_local1);

        dcdy(node_global1) = dcdy(node_global1) ...
          + c(node_global2) * dphidy(node_local2,node_local1);

      end

      node_count(node_global1) = node_count(node_global1) + 1;

    end

  end
%
%  Average the running totals.
%
  dcdx(1:node_num) = dcdx(1:node_num) ./ node_count(1:node_num);
  dcdy(1:node_num) = dcdy(1:node_num) ./ node_count(1:node_num);

  return
end
