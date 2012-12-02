function phi = local_basis_1d ( order, node_x, x )

%*****************************************************************************80
%
%% LOCAL_BASIS_1D evaluates the basis functions in an element.
%
%  Discussion:
%
%    PHI(I)(X) = product ( J ~= I ) ( X - NODE_X(I) ) / ( NODE_X(J) - NODE_X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the element.
%    0 <= ORDER.  ORDER = 1 means piecewise linear.
%
%    Input, real NODE_X(ORDER), the element nodes.  These must be distinct.
%    Basis function I is 1 when X = NODE_X(I) and 0 when X is equal
%    to any other node.
%
%    Input, real X, the point at which the basis functions are to be
%    evaluated.
%
%    Output, real PHI(ORDER), the basis functions.
%
  node_x = node_x ( : );

  phi = ones ( order, 1 );

  j = 1 : order;

  for i = 1 : order
    k = setdiff ( j, i );
    phi(k) = ( phi(k) * ( x - node_x(i) ) ) ./ ( node_x(k) - node_x(i) );
  end

  return
end
