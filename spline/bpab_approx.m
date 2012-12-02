function yval = bpab_approx ( n, a, b, ydata, xval )

%*****************************************************************************80
%
%% BPAB_APPROX evaluates the Bernstein polynomial for F(X) on [A,B].
%
%  Discussion:
%
%    The Bernstein polynomial BERN(F) for F(X) is an approximant, not an
%    interpolant; in other words, its value is not guaranteed to equal
%    that of F at any particular point.  However, for a fixed interval
%    [A,B], if we let N increase, the Bernstein polynomial converges
%    uniformly to F everywhere in [A,B], provided only that F is continuous.
%    Even if F is not continuous, but is bounded, the polynomial converges
%    pointwise to F(X) at all points of continuity.  On the other hand,
%    the convergence is quite slow compared to other interpolation
%    and approximation schemes.
%
%    BERN(F)(X) = sum ( 0 <= I <= N ) F(X(I)) * B_BASE(I,X)
%
%    where
%
%      X(I) = ( ( N - I ) * A + I * B ) / N
%      B_BASE(I,X) is the value of the I-th Bernstein basis polynomial at X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kahaner, Moler, and Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989.
%
%  Parameters:
%
%    Input, integer N, the degree of the Bernstein polynomial to be used.
%
%    Input, real A, B, the endpoints of the interval on which the
%    approximant is based.  A and B should not be equal.
%
%    Input, real YDATA(1:N+1), the data values at N+1 equally spaced points
%    in [A,B].  If N = 0, then the evaluation point should be 0.5 * ( A + B).
%    Otherwise, evaluation point I should be ( (N-I)*A + I*B ) / N ).
%
%    Input, real XVAL, the point at which the Bernstein polynomial
%    approximant is to be evaluated.  XVAL does not have to lie in the
%    interval [A,B].
%
%    Output, real YVAL, the value of the Bernstein polynomial approximant
%    for F, based in [A,B], evaluated at XVAL.
%

%
%  Evaluate the Bernstein basis polynomials at XVAL.
%
  bvec = bpab ( n, a, b, xval );
%
%  Now compute the sum of YDATA(I) * BVEC(I).
%
  yval = ydata(1:n+1)' * bvec(1:n+1);

  return
end
