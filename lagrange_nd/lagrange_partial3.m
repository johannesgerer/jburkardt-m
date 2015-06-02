function [ po, pc, pe, n2 ] = lagrange_partial3 ( d, n, nd, xd, option )

%*****************************************************************************80
%
%% LAGRANGE_PARTIAL3: Partial Lagrange polynomial basis from data.
%
%  Discussion:
%
%    This function, together with lagrange_partial4(), is a representation
%    of algorithm 4.1 in the reference, modified:
%    * for the case where the number of data points is less
%      than the dimension of the desired polynomial space,
%    * so that a form of "pivoting" is used
%      to select the next polynomial as the one with maximum absolute
%      value at the current node;
%    * so that if the problem is not well posed, successively higher
%      values of N are tried.
%
%    This function is given XD, a set of ND distinct data points in a 
%    D dimensional space, and returns information defining a set of 
%    ND Lagrange polynomials L(i)(X) with the property that:
%
%      L(i)(XD(j)) = delta(i,j)
%
%    This function is used in cases where ND, the number of data points, 
%    is less than or equal to R, the dimension of the space of polynomials 
%    in D dimensions and total degree N or less, that is:
%
%      ND <= R = Choose ( N + D, N )
%
%    There will be ND polynomials returned.  Each polynomial can have
%    as many as R coefficients.
%
%    Each polynomial is given as a vector, with each entry corresponding
%    to a nonzero coefficient.  In particular, for polynomial L(i)(X):
%
%      PO(i) is the order, that is, the number of nonzero coefficients;
%      PC(i,j), for 1 <= j <= PO(i), is the coefficient of the J-th term.
%      PE(i,j), for 1 <= j <= PO(i), encodes the exponents of the J-th term.
%
%    The exponent codes are a compact way of recording the exponent vector
%    associated with each monomial.  If PE(i,j) = k, then the corresponding
%    vector of D exponents can be determined by:
%
%      E = mono_unrank_grlex ( D, k );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Tomas Sauer, Yuan Xu,
%    On multivariate Lagrange interpolation,
%    Mathematics of Computation,
%    Volume 64, Number 211, July 1995, pages 1147-1170.
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer N, the maximum total degree.
%
%    Input, integer ND, the number of data points.
%    It must be the case that ND <= R = the number of monomials 
%    of degree N in D dimensions.
%
%    Input, real XD(D,ND), the data points, which must be distinct.
%
%    Input, integer OPTION, determines the initial basis:
%    0, monomials, 1, x, y, x^2, xy, y^2, x^3, ...
%    1, Legendre products, 1, y, x, (3y^2-1)/2, xy, (3^x^2-1), (5y^3-3)/2, ...
%
%    Output, integer PO(ND), the order (number of nonzero coefficients) for the 
%    Lagrange basis polynomials.
%
%    Output, real PC(ND,R), the coefficients for the 
%    Lagrange basis polynomials.
%
%    Output, integer PE(ND,R), the exponent indices for the 
%    Lagrange basis polynomials.
%
%    Output, integer N2, the adjusted value of N, which may have been
%    increased because the interpolation problem for N was not well posed.
%

%
%  Verify that the points are sufficiently distinct.
%
  [ d_min, d_max ] = r8col_separation ( d, nd, xd );
  d_tol = sqrt ( eps );

  if ( d_min < d_tol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGRANGE_PARTIAL3 - Fatal error!\n' );
    fprintf ( 1, '  Some points are too close!\n' );
    fprintf ( 1, '  Minimum data point separation is = %g.\n', d_min );
    error ( 'LAGRANGE_PARTIAL3 - Fatal error!' );
  end
%
%  Search for the appropriate interpolation space.
%
  n2 = n;
  tol = 0.0001;

  while ( 1 )

    r = mono_upto_enum ( d, n2 );

    [ po, pc, pe, success ] = lagrange_partial4 ( d, n2, r, nd, xd, option, tol );

    if ( success )
      return
    end

    n2 = n2 + 1;
    fprintf ( 'LAGRANGE_PARTIAL3 - Increase N to %d\n', n2 );

  end

  return
end
