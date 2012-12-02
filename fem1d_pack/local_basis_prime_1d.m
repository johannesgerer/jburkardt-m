function dphidx = local_basis_prime_1d ( order, node_x, x )

%*****************************************************************************80
%
%% LOCAL_BASIS_PRIME_1D evaluates the basis function derivatives in an element.
%
%  Discussion:
%
%    PHI(I)(X) = product ( J ~= I ) ( X - NODE_X(I) ) / ( NODE_X(J) - NODE_X(I) )
%
%    dPHIdx(I)(X) = sum ( J ~= I ) ( 1 / ( NODE_X(J) - NODE_X(I) ) *
%      product ( K ~= ( J, I ) ) ( X - NODE_X(I) ) / ( NODE_X(J) - NODE_X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2011
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
%    Input, real X, the evaluation point.
%
%    Output, real DPHIDX(ORDER), the derivatives of the basis functions.
%
  node_x = node_x ( : );

  dphidx = zeros ( order, 1 );

  for i = 1 : order

    for j = 1 : order

      if ( j ~= i )
        k = setdiff ( 1 : order, [ i, j ] );
        dphidx(i) = dphidx(i) + prod ( ( x - node_x(i) ) ./ ( node_x(k) - node_x(i) ) ) ...
          ;
      end

    end

  end

  return
end
