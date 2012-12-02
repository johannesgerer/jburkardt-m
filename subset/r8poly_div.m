function [ nq, q, nr, r ] = r8poly_div ( na, a, nb, b )

%*****************************************************************************80
%
%% R8POLY_DIV computes the quotient and remainder of two polynomials.
%
%  Discussion:
%
%    The polynomials are assumed to be stored in power sum form.
%
%    The power sum form of a polynomial is:
%
%      p(x) = a(0) + a(1) * x + ... + a(n-1) * x**(n-1) + a(n) * x**(n)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the dimension of A.
%
%    Input, real A(1:NA+1), the coefficients of the polynomial to be divided.
%
%    Input, integer NB, the dimension of B.
%
%    Input, real B(1:NB+1), the coefficients of the divisor polynomial.
%
%    Output, integer NQ, the degree of Q.
%    If the divisor polynomial is zero, NQ is returned as -1.
%
%    Output, real Q(1:NA-NB+1), contains the quotient of A/B.
%    If A and B have full degree, Q should be dimensioned Q(0:NA-NB).
%    In any case, Q(0:NA) should be enough.
%
%    Output, integer NR, the degree of R.
%    If the divisor polynomial is zero, NR is returned as -1.
%
%    Output, real R(1:NB), contains the remainder of A/B.
%    If B has full degree, R should be dimensioned R(0:NB-1).
%    Otherwise, R will actually require less space.
%
  na2 = r8poly_degree ( na, a );
  nb2 = r8poly_degree ( nb, b );

  if ( b(nb2) == 0.0 )
    nq = -1;
    nr = -1;
    return
  end

  a2(1:na+1) = a(1:na+1);

  nq = na2 - nb2;
  nr = nb2 - 1;

  for i = nq : -1 : 0
    q(i+1) = a2(i+nb2+1) / b(nb2+1);
    a2(i+nb2+1) = 0.0;
    a2(i+1:i+nb2) = a2(i+1:i+nb2) - q(i+1) * b(1:nb2);
  end

  r(1:nr+1) = a2(1:nr+1);

  return
end
