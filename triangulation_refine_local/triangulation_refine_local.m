function [ node_num2, element_num2, node_xy2, element_node2, ...
  element_neighbor2 ] = triangulation_refine_local ( node_num, ...
  element_num, node_xy, element_node, element_neighbor, element )

%*****************************************************************************80
%
%% TRIANGULATION_REFINE_LOCAL locally refines a triangulation.
%
%  Discussion:
%
%    To use and to update the element neighbor array efficiently, I here
%    assume that the definition is as follows:
%
%      ELEMENT_NEIGHBOR(I,E) is the index of the element which is adjacent
%      to element E, and opposite to the I-th node, whose index is
%      ELEMENT_NODE(I,E).
%
%                 N3
%                 |\
%                 | \
%      Neighbor 2 |  \ Neighbor 1
%                 | E \
%                 |    \
%                 N1----N2
%
%                 Neighbor 3
%
%    Unfortunately, I don't think I have always followed this convention,
%    nor do I think this is a standard convention.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2011
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
%    Input, real NODE_XY(2,NODE_NUM), the point coordinates.
%
%    Input, integer ELEMENT_NODE(3,ELEMENT_NUM), the nodes that make 
%    up the elements.
%
%    Input, integer ELEMENT_NEIGHBOR(3,ELEMENT_NUM), the element neighbors on 
%    each side.  If there is no element neighbor on a particular side, the 
%    value of should be negative. 
%
%    Input, integer ELEMENT, the index of the element to be refined.
%
%    Input, integer NODE_NUM2, the number of nodes.
%
%    Input, integer ELEMENT_NUM2, the number of elements.
%
%    Input, real NODE_XY2(2,NODE_NUM2), the point coordinates.
%
%    Input, integer ELEMENT_NODE2(3,ELEMENT_NUM2), the nodes that make 
%    up the elements.
%
%    Input, integer ELEMENT_NEIGHBOR2(3,ELEMENT_NUM2), the element neighbors on 
%    each side.  If there is no element neighbor on a particular side, the 
%    value should be negative. 
%

%
%  1: Determine the three new nodes.
%
  node_num2 = node_num + 3;
  n1 = element_node(1,element);
  n2 = element_node(2,element);
  n3 = element_node(3,element);
  n12 = node_num + 1;
  n23 = node_num + 2;
  n31 = node_num + 3;

  node_xy2 = zeros(2,node_num2);
  node_xy2(1:2,1:node_num) = node_xy(1:2,1:node_num);

  node_xy2(1:2,n12) = 0.5 * ( node_xy(1:2,n1) + node_xy(1:2,n2) );
  node_xy2(1:2,n23) = 0.5 * ( node_xy(1:2,n2) + node_xy(1:2,n3) );
  node_xy2(1:2,n31) = 0.5 * ( node_xy(1:2,n3) + node_xy(1:2,n1) );
%
%  2: Revise the element information.  Where there were 4 elements,
%  there will now be 10 (unless the element is missing neighbors).
%
  ea1 = element_neighbor(1,element);
  eb1 = element_neighbor(2,element);
  ec1 = element_neighbor(3,element);

  element_num2 = element_num;

  element_num2 = element_num2 + 1;
  e1 = element_num2;

  element_num2 = element_num2 + 1;
  e2 = element_num2;

  element_num2 = element_num2 + 1;
  e3 = element_num2;

  if ( 0 < ea1 )
    element_num2 = element_num2 + 1;
    ea2 = element_num2;
  else
    ea2 = -1;
  end

  if ( 0 < eb1 )
    element_num2 = element_num2 + 1;
    eb2 = element_num2;
  else
    eb2 = -1;
  end

  if ( 0 < ec1 )
    element_num2 = element_num2 + 1;
    ec2 = element_num2;
  else
    ec2 = -1;
  end

  element_node2 = zeros(3,element_num2);
 
  element_node2(1:3,1:element_num) = element_node(1:3,1:element_num);

  element_node2(1:3,element) = [ n23; n31; n12 ];
  element_node2(1:3,e1) = [ n1; n12; n31 ];
  element_node2(1:3,e2) = [ n2; n23; n12 ];
  element_node2(1:3,e3) = [ n3; n31; n23 ];

  if ( 0 < ea1 )
    na = outlier ( element_node(1:3,element), element_node(1:3,ea1) );
    element_node2(1:3,ea1) = [ n2; na; n23 ];
    element_node2(1:3,ea2) = [ na; n3; n23 ];
  end

  if ( 0 < eb1 )
    nb = outlier ( element_node(1:3,element), element_node(1:3,eb1) );
    element_node2(1:3,eb1) = [ n3; nb; n31 ];
    element_node2(1:3,eb2) = [ nb; n1; n31 ];
  end

  if ( 0 < ec1 )
    nc = outlier ( element_node(1:3,element), element_node(1:3,ec1) );
    element_node2(1:3,ec1) = [ n1; nc; n12 ];
    element_node2(1:3,ec2) = [ nc; n2; n12 ];
  end
%
%  3: Revise the neighbor information.
%
  element_neighbor2 = zeros(3,element_num2);
  element_neighbor2(1:3,1:element_num) = element_neighbor(1:3,1:element_num);

  element_neighbor2(1:3,element) = [ e1; e2; e3 ];

  element_neighbor2(1:3,e1) = [ element; eb2; ec1 ];
  element_neighbor2(1:3,e2) = [ element; ec2; ea1 ];
  element_neighbor2(1:3,e3) = [ element; ea2; eb1 ];

  if ( 0 < ea1 )
    i = i4vec_find ( 3, element_neighbor(1:3,ea1), element );
    i = i4_wrap ( i + 1, 1, 3 );
    ea3 = element_neighbor(i,ea1);
    i = i4_wrap ( i + 1, 1, 3 );
    ea4 = element_neighbor(i,ea1);
    element_neighbor2(1:3,ea1) = [ ea2; e2; ea3 ];
    element_neighbor2(1:3,ea2) = [ e3; ea1; ea4 ];
    i = i4vec_find ( 3, element_neighbor(1:3,ea4), ea1 );
    element_neighbor2(i,ea4) = ea2;
  end

  if ( 0 < eb1 )
    i = i4vec_find ( 3, element_neighbor(1:3,eb1), element );
    i = i4_wrap ( i + 1, 1, 3 );
    eb3 = element_neighbor(i,eb1);
    i = i4_wrap ( i + 1, 1, 3 );
    eb4 = element_neighbor(i,eb1);
    element_neighbor2(1:3,eb1) = [ eb2; e3; eb3 ];
    element_neighbor2(1:3,eb2) = [ e1; eb1; eb4 ];
    i = i4vec_find ( 3, element_neighbor(1:3,eb4), eb1 );
    element_neighbor2(i,eb4) = eb2;
  end

  if ( 0 < ec1 )
    i = i4vec_find ( 3, element_neighbor(1:3,ec1), element );
    i = i4_wrap ( i + 1, 1, 3 );
    ec3 = element_neighbor(i,ec1);
    i = i4_wrap ( i + 1, 1, 3 );
    ec4 = element_neighbor(i,ec1);
    element_neighbor2(1:3,ec1) = [ ec2; e1; ec3 ];
    element_neighbor2(1:3,ec2) = [ e2; ec1; ec4 ];
    i = i4vec_find ( 3, element_neighbor(1:3,ec4), ec1 );
    element_neighbor2(i,ec4) = ec2;
  end

  return
end
