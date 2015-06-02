function [ po, pc, pe, success ] = lagrange_partial4 ( d, n, r, nd, xd, ...
  option, tol )

%*****************************************************************************80
%
%% LAGRANGE_PARTIAL4: Partial Lagrange polynomial basis from data.
%
%  Discussion:
%
%    This function, together with lagrange_partial3(), is a representation
%    of algorithm 4.1 in the reference, modified:
%    * for the case where the number of data points is less
%      than the dimension of the desired polynomial space,
%    * so that a form of "pivoting" is used
%      to select the next polynomial as the one with maximum absolute
%      value at the current node;
%    * so that if the problem is not well posed, successively higher
%      values of N are tried.
%
%    This function is given XD, a set of ND data points in a D dimensional
%    space, and returns information defining a set of ND Lagrange polynomials
%    L(i)(X) with the property that:
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
%    Input, integer R, the number of monomials in D dimensions 
%    of total degree N or less.
%
%    Input, integer ND, the number of data points.
%    It must be the case that ND <= R.
%
%    Input, real XD(D,ND), the data points.
%
%    Input, integer OPTION, determines the initial basis:
%    0, use monomials, 1, x, y, x^2, xy, y^2, x^3, ...
%    1, use Legendre products, 1, y, x, (3y^2-1)/2, xy, (3^x^2-1), (5y^3-3)/2,...
%
%    Input, real TOL, a tolerance for the pivoting operation.
%    If no unused polynomial can be found with a value at least TOL
%    at the current point, the algorithm fails.
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
%    Output, integer SUCCESS, is 0 if the algorithm failed
%    (in which case the other outputs are not useful),
%    and 1 if it was successful.
%
  success = 1;
%
%  Verify that R is correct.
%
  if ( r < nd )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGRANGE_PARTIAL4 - Fatal error!\n' );
    fprintf ( 1, '  The value R = %d is less than ND = %d.\n', r, nd );
    error ( 'LAGRANGE_PARTIAL4 - Fatal error!' );
  end
%
%  Initialize the polynomials Q which span the space of N-th degree polynomials.
%  There are R monomials in this space.
%
  qo = zeros ( r, 1 );
  qc = zeros ( r, r );
  qe = zeros ( r, r );

  for k = 1 : r

    if ( option == 0 )
      o = 1;
      c(1) = 1.0;
      e(1) = k;
    elseif ( option == 1 )
      lpp = comp_unrank_grlex ( d, k );
      [ o, c, e ] = lpp_to_polynomial ( d, lpp, r );
    end

    qo(k) = o;
    qc(k,1:o) = c(1:o)';
    qe(k,1:o) = e(1:o)';

  end
%
%  Now set up the P polynomials.
%
  po = zeros ( nd, 1 );
  pc = zeros ( nd, r );
  pe = zeros ( nd, r );

  for k = 1 : nd
%
%  Find the polynomial Q(K:R)(X) which is most nonzero at X(K).
%
    i = r + 1;
    value_max = 0.0;

    for j = k : r

      o = qo(j);
      value = polynomial_value ( d, o, qc(j,1:o), qe(j,1:o), 1, xd(1:d,k) );
  
      if ( abs ( value_max ) <= abs ( value ) )
        i = j;
        value_max = value;
      end

    end
%
%  If the best nonzero value was too small or zero, fail.
%
    if ( abs ( value_max ) < tol || i == r + 1 )
      success = 0;
      fprintf ( 1, 'LAGRANGE_PARTIAL4 - Unacceptable VALUE_MAX = %g\n', value_max );
      return
    end

    value = value_max;
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
