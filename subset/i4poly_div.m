function [ nq, q, nr, r ] = i4poly_div ( na, a, nb, b )

%% I4POLY_DIV computes the quotient and remainder of two polynomials.
%
%  Discussion:
%
%    Normally, the quotient and remainder would have rational coefficients.
%    This routine assumes that the special case applies that the quotient
%    and remainder are known beforehand to be integral.
%
%    The polynomials are assumed to be stored in power sum form.
%
%    The power sum form is:
%
%      p(x) = a(0) + a(1)*x + ... + a(n-1)*x**(n-1) + a(n)*x**(n)
%
%    Since MATLAB will not allow 0-based indices, the algorithm has been
%    crudely modified by adding one to all array indices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the dimension of A.
%
%    Input, integer A(1:NA+1), the coefficients of the polynomial to be divided.
%
%    Input, integer NB, the dimension of B.
%
%    Input, integer B(1:NB+1), the coefficients of the divisor polynomial.
%
%    Output, integer NQ, the degree of Q.
%    If the divisor polynomial is zero, NQ is returned as -1.
%
%    Output, integer Q(1:NA-NB+1), contains the quotient of A/B.
%    If A and B have full degree, Q should be dimensioned Q(1:NA-NB+1).
%    In any case, Q(1:NA+1) should be enough.
%
%    Output, integer NR, the degree of R.
%    If the divisor polynomial is zero, NR is returned as -1.
%
%    Output, integer R(1:NB), contains the remainder of A/B.
%    If B has full degree, R should be dimensioned R(1:NB).
%    Otherwise, R will actually require less space.
%
  na2 = i4poly_degree ( na, a );

  nb2 = i4poly_degree ( nb, b );

  if ( b(nb2+1) == 0 )
    nq = -1;
    nr = -1;
    return
  end

  a2(1:na2+1) = a(1:na2+1);

  nq = na2 - nb2;
  nr = nb2 - 1;

  for i = nq : -1 : 0
    q(i+1) = floor ( a2(i+nb2+1) / b(nb2+1) );
    a2(i+nb2+1) = 0;
    a2(i+1:i+nb2) = a2(i+1:i+nb2) - q(i+1) * b(1:nb2);
  end

  r(1:nr+1) = a2(1:nr+1);

  return
end
