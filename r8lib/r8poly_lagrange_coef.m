function pcof = r8poly_lagrange_coef ( npol, ipol, xpol )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_COEF returns the coefficients of a Lagrange polynomial.
%
%  Discussion:
%
%    Given distinct abscissas XPOL(1:NPOL), the IPOL-th Lagrange
%    polynomial L(IPOL)(X) is defined as the polynomial of degree
%    NPOL - 1 which is 1 at XPOL(IPOL) and 0 at the NPOL - 1 other
%    abscissas.
%
%    A formal representation is:
%
%      L(IPOL)(X) = Product ( 1 <= I <= NPOL, I /= IPOL )
%       ( X - X(I) ) / ( X(IPOL) - X(I) )
%
%    However sometimes it is desirable to be able to write down
%    the standard polynomial coefficients of L(IPOL)(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2005
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
%    Input, real XPOL(NPOL), the abscissas of the
%    Lagrange polynomials.  The entries in XPOL must be distinct.
%
%    Output, real PCOF(1:NPOL), the standard polynomial
%    coefficients of the IPOL-th Lagrange polynomial:
%      L(IPOL)(X) = SUM ( 0 <= I <= NPOL-1 ) PCOF(I+1) * X**I
%

%
%  Make sure IPOL is legal.
%
  if ( ipol < 1 || npol < ipol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY_LAGRANGE_COEF - Fatal error!\n' );
    fprintf ( 1, '  1 <= IPOL <= NPOL is required.\n' );
    error ( 'R8POLY_LAGRANGE_COEF - Fatal error!' );
  end
%
%  Check that the abscissas are distinct.
%
  if ( ~r8vec_distinct ( npol, xpol ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY_LAGRANGE_COEF - Fatal error!\n' );
    fprintf ( 1, '  Two or more entries of XPOL are equal:\n' );
    error ( 'R8POLY_LAGRANGE_COEF - Fatal error!' );
  end

  pcof(1) = 1.0;
  pcof(2:npol) = 0.0;

  indx = 0;

  for i = 1 : npol

    if ( i ~= ipol )

      indx = indx + 1;

      for j = indx : -1 : 0

        pcof(j+1) = -xpol(i) * pcof(j+1) / ( xpol(ipol) - xpol(i) );

        if ( 0 < j )
          pcof(j+1) = pcof(j+1) + pcof(j) / ( xpol(ipol) - xpol(i) );
        end

      end

    end

  end

  return
end
