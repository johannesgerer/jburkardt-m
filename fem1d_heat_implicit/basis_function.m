function [ b, dbdx ] = basis_function ( index, element, node_x, point_num, ...
  point_x )

%*****************************************************************************80
%
%% BASIS_FUNCTION evaluates a basis function.
%
%  Discussion:
%
%    Basis functions are associated with NODES, and are numbered 1 to NODE_NUM.
%
%    Elements are associated with intervals, having nodes as endpoints.
%    Element I begins at node I and ends at node I+1.
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
%    Input, integer INDEX, the index of the basis function to be evaluated.
%
%    Input, integer ELEMENT, the index of the element in which the points lie.
%
%    Input, real NODE_X(NODE_NUM), the coordinates of nodes.
%
%    Input, integer POINT_NUM, the number of evaluation points.
%
%    Input, real POINT_X(POINT_NUM), the evaluation points.
%
%    Output, real B(POINT_NUM), the basis function and its derivative, evaluated
%    at the evaluation points.
%
  b    = zeros ( point_num, 1 );
  dbdx = zeros ( point_num, 1 );

  if ( index == element )

    b    = ( node_x(element+1) - point_x ) / ( node_x(element+1) - node_x(element) );
    dbdx =                     - 1.0       / ( node_x(element+1) - node_x(element) );

  elseif ( index == element + 1 )

    b    = ( point_x - node_x(element) )   / ( node_x(element+1) - node_x(element) );
    dbdx = + 1.0                           / ( node_x(element+1) - node_x(element) );

  end

  return
end
