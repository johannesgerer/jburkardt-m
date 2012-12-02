function dwdx = r8poly_lagrange_1 ( npol, xpol, xval )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_1 evaluates the first derivative of the Lagrange factor.
%
%  Formula:
%
%    W(XPOL(1:NPOL))(X) = Product ( 1 <= I <= NPOL ) ( X - XPOL(I) )
%
%    W'(XPOL(1:NPOL))(X)
%      = Sum ( 1 <= J <= NPOL ) Product ( I /= J ) ( X - XPOL(I) )
%
%    We also have the recursion:
%
%      W'(XPOL(1:NPOL))(X) = d/dX ( ( X - XPOL(NPOL) ) * W(XPOL(1:NPOL-1))(X) )
%                    = W(XPOL(1:NPOL-1))(X)
%                    + ( X - XPOL(NPOL) ) * W'(XPOL(1:NPOL-1))(X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NPOL, the number of abscissas.
%
%    Input, real XPOL(NPOL), the abscissas, which should be distinct.
%
%    Input, real XVAL, the point at which the Lagrange factor is to be
%    evaluated.
%
%    Output, real DWDX, the derivative of W with respect to XVAL.
%
  dwdx = 0.0;
  w = 1.0;

  for i = 1 : npol

    dwdx = w + ( xval - xpol(i) ) * dwdx;
    w = w * ( xval - xpol(i) );

  end

  return
end
