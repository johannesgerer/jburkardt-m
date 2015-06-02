function w = qwv ( n, a, b, x )

%*****************************************************************************80
%
%% QWV computes quadrature weights using the Vandermonde matrix.
%
%  Discussion:
%
%    We assume that the quadrature formula approximates integrals of the form:
%
%      I(F) = Integral ( A <= X <= B ) F(X) dX
%
%    by specifying N points X and weights W such that
%
%      Q(F) = Sum ( 1 <= I <= N ) W(I) * F(X(I))
%
%    Now let us assume that the points X have been specified, but that the
%    corresponding values W remain to be determined.
%
%    If we require that the quadrature rule with N points integrates the first
%    N monomials exactly, then we have N conditions on the weights W.
%
%    The I-th condition, for the monomial X^(I-1), has the form:
%
%      W(1)*X(1)^(I-1) + W(2)*X(2)^(I-1)+...+W(N)*X(N)^(I-1) = (B^I-A^I)/I.
%
%    The corresponding matrix is known as the Vandermonde matrix.  It is
%    theoretically guaranteed to be nonsingular as long as the X's are
%    distinct, but its condition number grows quickly with N.  Therefore,
%    this simple, direct approach is often abandoned when more accuracy
%    or high order rules are needed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points in the rule.
%
%    Input, real A, B, the left and right endpoints of the
%    integration interval.
%
%    Input, real X(N,1), the quadrature points.
%
%    Output, real W(N,1), the quadrature weights.
%

%
%  Destroy all row vectors!
%
  x = x(:);

  v = zeros ( n, n );
%
%  Define the Vandermonde matrix for X.
%
  v(1,1:n) = 1.0;

  for i = 2 : n
    v(i,1:n) = v(i-1,1:n) .* x(1:n,1)';
  end
%
%  The right hand side
%  RHS(I) = integral ( A <= X <= B ) X^(I-1) dx = X^I/I
%
  rhs = zeros ( n, 1 );
  for i = 1 : n
    rhs(i) = ( b^i - a^i ) / i;
  end

  r8mat_print ( n, n, v, '  Matrix:' );
  r8vec_print ( n, rhs, '  Right hand side:' );
%
%  Solve V * W = RHS to get the weights.
%
  w = v \ rhs;

  return
end
