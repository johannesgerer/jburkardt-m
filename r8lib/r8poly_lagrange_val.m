function [ pval, dpdx ] = r8poly_lagrange_val ( npol, ipol, xpol, xval )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_VAL evaluates the IPOL-th Lagrange polynomial.
%
%  Discussion:
%
%    Given NPOL distinct abscissas, XPOL(1:NPOL), the IPOL-th Lagrange
%    polynomial L(IPOL)(X) is defined as the polynomial of degree
%    NPOL - 1 which is 1 at XPOL(IPOL) and 0 at the NPOL - 1 other
%    abscissas.
%
%    A formal representation is:
%
%      L(IPOL)(X) = Product ( 1 <= I <= NPOL, I /= IPOL )
%       ( X - X(I) ) / ( X(IPOL) - X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2005
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
%    Input, integer IPOL, the index of the polynomial to evaluate.
%    IPOL must be between 1 and NPOL.
%
%    Input, real XPOL(NPOL), the abscissas of the Lagrange
%    polynomials.  The entries in XPOL must be distinct.
%
%    Input, real XVAL, the point at which the IPOL-th 
%    Lagrange polynomial is to be evaluated.
%
%    Output, real PVAL, the value of the IPOL-th Lagrange
%    polynomial at XVAL.
%
%    Output, real DPDX, the derivative of the IPOL-th 
%    Lagrange polynomial at XVAL.
%

%
%  Make sure IPOL is legal.
%
  if ( ipol < 1 || npol < ipol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY_LAGRANGE_VAL - Fatal error!\n' );
    fprintf ( 1, '  1 <= IPOL <= NPOL is required.\n' );
    error ( 'R8POLY_LAGRANGE_VAL - Fatal error!' );
  end
%
%  Check that the abscissas are distinct.
%
  if ( ~r8vec_distinct ( npol, xpol ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY_LAGRANGE_VAL - Fatal error!\n' );
    fprintf ( 1, '  Two or more entries of XPOL are equal:\n' );
    error ( 'R8POLY_LAGRANGE_VAL - Fatal error!' );
  end
%
%  Evaluate the polynomial.
%
  pval = 1.0;

  for i = 1 : npol

    if ( i ~= ipol )

      pval = pval * ( xval - xpol(i) ) / ( xpol(ipol) - xpol(i) );

    end

  end
%
%  Evaluate the derivative, which can be found by summing up the result
%  of differentiating one factor at a time, successively.
%
  dpdx = 0.0;

  for i = 1 : npol

    if ( i ~= ipol )

      p2 = 1.0;
      for j = 1 : npol

        if ( j == i )
          p2 = p2                      / ( xpol(ipol) - xpol(j) );
        elseif ( j ~= ipol )
          p2 = p2 * ( xval - xpol(j) ) / ( xpol(ipol) - xpol(j) );
        end

      end

      dpdx = dpdx + p2;

    end

  end

  return
end
