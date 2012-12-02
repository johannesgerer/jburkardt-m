function [ u, dudr, duds ] = interp ( code, element_order, r, s, node_u )

%*****************************************************************************80
%
%% INTERP interpolates a quantity in an element from basis node values.
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
%    Input, character ( len = * ) CODE, identifies the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%
%    Input, integer ELEMENT_ORDER, the order of the element.
%
%    Input, real R, S, the reference coordinates of a point.
%
%    Input, real NODE_U(ELEMENT_ORDER), the value of the quantity
%    at the basis nodes.
%
%    Output, real U, DUDR, DUDS, the interpolated value of the
%    quantity and its derivatives at the point (R,S).
%
  [ t, dtdr, dtds ] = shape ( code, r, s );

  u    = node_u(1:element_order) * t(1:element_order)';
  dudr = node_u(1:element_order) * dtdr(1:element_order)';
  duds = node_u(1:element_order) * dtds(1:element_order)';

  return
end
