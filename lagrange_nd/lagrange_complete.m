function [ po, pc, pe ] = lagrange_complete ( d, n, r, nd, xd )

%*****************************************************************************80
%
%% LAGRANGE_COMPLETE: Complete Lagrange polynomial basis from data.
%
%  Discussion:
%
%    This function represents algorithm 4.1 in the reference.
%
%    This function is given XD, a set of ND distinct data points in a 
%    D dimensional space, and returns information defining a set of 
%    ND Lagrange polynomials L(i)(X) with the property that:
%
%      L(i)(XD(j)) = delta(i,j)
%
%    This function does a very weak form of pivoting, by selecting
%    the very next polynomial that is "nonzero" at the current point.
%    An improved version of this function chooses instead the polynomial
%    with maximum function value at the current point.
%
%    In order for this computation to be carried out, it is necessary that
%    ND, the number of data points, is equal to R, the dimension of the 
%    space of polynomials in D dimensions and total degree N or less, that is:
%
%      ND = R = Choose ( N + D, N )
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
%    24 February 2014
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
%    Input, integer R, the number of monomials in D dimensions 
%    of total degree N or less.
%
%    Input, integer ND, the number of data points.
%    This function requires that the ND is equal to R.
%
%    Input, real XD(D,ND), the data points, which must be distinct.
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

%
%  Verify that R is correct.
%
  if ( r ~= mono_upto_enum ( d, n ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGRANGE_COMPLETE - Fatal error!\n' );
    fprintf ( 1, '  The value R is not correct.\n' );
    error ( 'LAGRANGE_COMPLETE - Fatal error!' );
  end

  if ( r ~= nd )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGRANGE_COMPLETE - Fatal error!\n' );
    fprintf ( 1, '  The value R = %d does not equal ND = %d.\n', r, nd );
    error ( 'LAGRANGE_COMPLETE - Fatal error!' );
  end
%
%  Verify that the points are sufficiently distinct.
%
  [ d_min, d_max ] = r8col_separation ( d, nd, xd );
  d_tol = sqrt ( eps );

  if ( d_min < d_tol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGRANGE_COMPLETE - Fatal error!\n' );
    fprintf ( 1, '  Some points are too close!\n' );
    fprintf ( 1, '  Minimum data point separation is = %g.\n', d_min );
    error ( 'LAGRANGE_COMPLETE - Fatal error!' );
  end
%
%  Initialize the polynomials Q to be all monomials of degree N or less.
%
  qo = zeros ( r, 1 );
  qc = zeros ( r, r );
  qe = zeros ( r, r );

  for k = 1 : r
    qo(k,1) = 1;
    qc(k,1) = 1.0;
    qe(k,1) = k;
  end
%
%  Now set up the P polynomials.
%
  po = zeros ( r, 1 );
  pc = zeros ( r, r );
  pe = zeros ( r, r );

  for k = 1 : nd
%
%  Find the first polynomial Q(K:R)(X) which is nonzero at X(K).
%
    i = r + 1;

    for j = k : r
      o = qo(j);
      value = polynomial_value ( d, o, qc(j,1:o), qe(j,1:o), 1, xd(1:d,k) );
      if ( value ~= 0.0 )
        i = j;
        break
      end
    end

    if ( i == r + 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LAGRANGE_COMPLETE - Fatal error!\n' );
      fprintf ( 1, '  I = R+1.\n' );
      error ( 'LAGRANGE_COMPLETE - Fatal error!' );
    end
%
%  Define P(K)(X) = Q(I)(X) / Q(I)(X(k)
%
    o = qo(i);
    po(k) = qo(i);
    pc(k,1:o) = qc(i,1:o) / value;
    pe(k,1:o) = qe(i,1:o);
%
%  Modify P(1:k-1)(X).
%
    for j = 1 : k - 1

      oj = po(j);
      ok = po(k);

      value = polynomial_value ( d, oj, pc(j,1:oj), pe(j,1:oj), 1, xd(1:d,k) );

      [ o, c, e ] = polynomial_axpy ( - value, ok, pc(k,1:ok), pe(k,1:ok), ...
        oj, pc(j,1:oj), pe(j,1:oj) );

      po(j) = o;
      pc(j,1:o) = c(1:o)';
      pe(j,1:o) = e(1:o)';

    end
%
%  Modify Q(I:downto:K+1)
%
    for j = i : -1 : k + 1

      oj = qo(j-1);
      ok = po(k);

      value = polynomial_value ( d, oj, qc(j-1,1:oj), qe(j-1,1:oj), ...
        1, xd(1:d,k) );
 
      [ o, c, e ] = polynomial_axpy ( - value, ok, pc(k,1:ok), pe(k,1:ok), ...
        oj, qc(j-1,1:oj), qe(j-1,1:oj) );

      qo(j) = o;
      qc(j,1:o) = c(1:o)';
      qe(j,1:o) = e(1:o)';

    end
%
%  Modify Q(I+1:R)
%
    for j = i + 1 : r

      oj = qo(j);
      ok = po(k);

      value = polynomial_value ( d, oj, qc(j,1:oj), qe(j,1:oj), ...
        1, xd(1:d,k) );

      [ o, c, e ] = polynomial_axpy ( - value, ok, pc(k,1:ok), pe(k,1:ok), ...
        oj, qc(j,1:oj), qe(j,1:oj) );

      qo(j) = o;
      qc(j,1:o) = c(1:o)';
      qe(j,1:o) = e(1:o)';

    end

  end
%
%  Get rid of tiny coefficients.
%
  for i = 1 : nd
    oi = po(i);
    [ o, c, e ] = polynomial_compress ( ...
      po(i), pc(i,1:oi), pe(i,1:oi) );
    po(i) = o;
    pc(i,1:o) = c(1:o)';
    pe(i,1:o) = e(1:o)';
  end

  return
end
