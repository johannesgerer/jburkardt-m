function wval = r8poly_lagrange_0 ( npol, xpol, xval )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_0 evaluates the Lagrange factor at a point.
%
%  Formula:
%
%    W(X) = Product ( 1 <= I <= NPOL ) ( X - XPOL(I) )
%
%  Discussion:
%
%    For a set of points XPOL(I), 1 <= I <= NPOL, the IPOL-th Lagrange basis
%    polynomial L(IPOL)(X), has the property:
%
%      L(IPOL)( XPOL(J) ) = delta ( IPOL, J )
%
%    and may be expressed as:
%
%      L(IPOL)(X) = W(X) / ( ( X - XPOL(IPOL) ) * W'(XPOL(IPOL)) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NPOL, the number of abscissas.
%    NPOL must be at least 1.
%
%    Input, real XPOL(NPOL), the abscissas, which should be distinct.
%
%    Input, real XVAL, the point at which the Lagrange factor is to be
%    evaluated.
%
%    Output, real WVAL, the value of the Lagrange factor at XVAL.
%
  wval = prod ( xval - xpol(1:npol) );

  return
end
