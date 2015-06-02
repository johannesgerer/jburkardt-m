function physical_x = reference_to_physical ( element, element_node, node_x, ...
  reference_num, reference_x )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL maps points in the reference interval into an element.
%
%  Discussion:
%
%    The reference interval is [ -1.0, +1.0 ].
%
%    Element ELEMENT extends from node ELEMENT_NODE(1,ELEMENT) to ELEMENT_NODE(2,ELEMENT).
%
%    The coordinate of node NODE is NODE_X(NODE).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT, the index of the element.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM);
%    ELEMENT_NODE(I,J) is the global index of local node I in element J.
%
%    Input, real NODE_X(NODE_NUM), the coordinates of nodes.
%
%    Input, integer REFERENCE_NUM, the number of points in the reference
%    interval to be transformed.
%
%    Input, real REFERENCE_X(REFERENCE_NUM), the coordinates of the
%    points in the reference interval.
%
%    Output, real PHYSICAL_X(REFERENCE_NUM), the coordinates of the
%    points in the element which correspond to the reference points.
%
  a = node_x(element_node(1,element) );
  b = node_x(element_node(2,element) );

  physical_x = ( ( 1.0 - reference_x             ) * a   ...
               + (       reference_x - ( - 1.0 ) ) * b ) ...
               / ( 1.0               - ( - 1.0 ) );

  return
end
