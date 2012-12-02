function px = least_val ( nterms, b, c, d, x )

%*****************************************************************************80
%
%% LEAST_VAL evaluates a least squares polynomial defined by LEAST_SET.
%
%  Discussion:
%
%    The least squares polynomial is assumed to be defined as a sum
%
%      P(X) = SUM ( I = 1 to NTERMS ) D(I) * P(I-1,X)
%
%    where the orthogonal basis polynomials P(I,X) satisfy the following
%    three term recurrence:
%
%      P(-1,X) = 0
%      P(0,X) = 1
%      P(I,X) = ( X - B(I-1) ) * P(I-1,X) - C(I-1) * P(I-2,X)
%
%    Therefore, the least squares polynomial can be evaluated as follows:
%
%    If NTERMS is 1, then the value of P(X) is D(1) * P(0,X) = D(1).
%
%    Otherwise, P(X) is defined as the sum of NTERMS > 1 terms.  We can
%    reduce the number of terms by 1, because the polynomial P(NTERMS,X)
%    can be rewritten as a sum of polynomials;  Therefore, P(NTERMS,X)
%    can be eliminated from the sum, and its coefficient merged in with
%    those of other polynomials.  Repeat this process for P(NTERMS-1,X)
%    and so on until a single term remains.
%    P(NTERMS,X) of P(NTERMS-1,X)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Samuel Conte, Carl deBoor,
%    Elementary Numerical Analysis,
%    Second Edition,
%    McGraw Hill, 1972,
%    ISBN: 07-012446-4,
%    LC: QA297.C65.
%
%  Parameters:
%
%    Input, integer NTERMS, the number of terms in the least squares
%    polynomial.  NTERMS must be at least 1.  The input value of NTERMS
%    may be reduced from the value given to LEAST_SET.  This will
%    evaluate the least squares polynomial of the lower degree specified.
%
%    Input, real B(NTERMS), C(NTERMS), D(NTERMS), the information
%    computed by LEAST_SET.
%
%    Input, real X, the point at which the least squares polynomial
%    is to be evaluated.
%
%    Output, real PX, the value of the least squares 
%    polynomial at X.
%
  px = d(nterms);
  prev = 0.0;

  for i = nterms-1 : -1 : 1

    prev2 = prev;
    prev = px;

    if ( i == nterms-1 )
      px = d(i) + ( x - b(i) ) * prev;
    else
      px = d(i) + ( x - b(i) ) * prev - c(i+1) * prev2;
    end

  end

  return
end
