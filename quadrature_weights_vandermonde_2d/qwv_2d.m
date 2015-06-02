function w = qwv_2d ( t, n, a, b, c, d, x, y )

%*****************************************************************************80
%
%% QWV_2D computes 2D quadrature weights using the Vandermonde matrix.
%
%  Discussion:
%
%    We assume that the quadrature formula approximates integrals of the form:
%
%      I(F) = Integral ( C <= Y <= D ) Integral ( A <= X <= B ) F(X,Y) dX dY
%
%    by specifying N points (X,Y) and weights W such that
%
%      Q(F) = Sum ( 1 <= I <= N ) W(I) * F(X(I),Y(I))
%
%    Now let us assume that the points (X,Y) have been specified, but that the
%    corresponding values W remain to be determined.
%
%    If we require that the quadrature rule with N points integrates the first
%    N monomials exactly, then we have N conditions on the weights W.
%
%    The K-th condition, for the monomial X^I*Y^J, J = 0 to T, I = 0 to T - J,
%    has the form:
%
%      W(1)*X(1)^I*Y(1)^J + W(2)*X(2)^I*Y(2)^j+...+W(N)*X(N)^I*Y(N)^J = 
%      = (B^(I+1)-A^(I+1))*(D^(J+1)-C(J+1))/(I+1)/(J+1)
%
%    The corresponding matrix is known as the 2D Vandermonde matrix.  It is
%    theoretically guaranteed to be nonsingular as long as the (X,Y) are
%    distinct, but its condition number grows quickly.  Therefore,
%    this simple, direct approach is often abandoned when more accuracy
%    or high order rules are needed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer T, the desired total degree.
%    0 <= T.
%
%    Input, integer N, the number of points in the rule.
%    It should be the case that T = (N+1)*(N+2)/2.
%
%    Input, real A, B, C, D the endpoints of the X and Y intervals.
%
%    Input, real X(N), Y(N), the quadrature points.
%
%    Output, real  W(N), the quadrature weights.
%
%

%
%  Destroy all row vectors!
%
  x = x(:);
  y = y(:);
%
%  Define the Vandermonde matrix.
%
  v = zeros ( n, n );
  rhs = zeros ( n, 1 );

  k = 0;
  for j = 0 : t
    for i = 0 : t - j
      k = k + 1;
      for l = 1 : n
        v(k,l) = x(l) ^ i * y(l) ^ j;
      end
      rhs(k) = ( b ^ ( i + 1 ) - a ^ ( i + 1 ) ) / ( i + 1 ) ...
             * ( d ^ ( j + 1 ) - c ^ ( j + 1 ) ) / ( j + 1 );
    end
  end

  if ( 0 )
    r8mat_print ( n, n, v, '  Matrix:' );
  end 

  if ( 0 )
    r8vec_print ( n, rhs, '  Right hand side:' );
  end
%
%  Solve V * W = RHS to get the weights.
%
  w = v \ rhs;

  return
end
