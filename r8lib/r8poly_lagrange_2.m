function dw2dx2 = r8poly_lagrange_2 ( npol, xpol, xval )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_2 evaluates the second derivative of the Lagrange factor.
%
%  Formula:
%
%    W(X)  = Product ( 1 <= I <= NPOL ) ( X - XPOL(I) )
%
%    W'(X) = Sum ( 1 <= J <= NPOL )
%            Product ( I /= J ) ( X - XPOL(I) )
%
%    W"(X) = Sum ( 1 <= K <= NPOL )
%            Sum ( J =/ K )
%            Product ( I /= K, J ) ( X - XPOL(I) )
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
%    Output, real DW2DX2, the second derivative of W with respect to XVAL.
%
  dw2dx2 = 0.0;

  for k = 1 : npol

    for j = 1 : npol

      if ( j ~= k )
        term = 1.0;

        for i = 1: npol
          if ( i ~= j && i ~= k )
            term = term * ( xval - xpol(i) );
          end
        end

        dw2dx2 = dw2dx2 + term;

      end

    end

  end

  return
end
