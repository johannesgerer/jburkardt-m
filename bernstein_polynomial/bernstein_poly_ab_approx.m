function yval = bernstein_poly_ab_approx ( n, a, b, ydata, nval, xval )

%*****************************************************************************80
%
%% BERNSTEIN_POLY_AB_APPROX: Bernstein polynomial approximant to F(X) on [A,B].
%
%  Formula:
%
%    BPAB(F)(X) = sum ( 0 <= I <= N ) F(X(I)) * B_BASE(I,X)
%
%    where
%
%      X(I) = ( ( N - I ) * A + I * B ) / N
%      B_BASE(I,X) is the value of the I-th Bernstein basis polynomial at X.
%
%  Discussion:
%
%    The Bernstein polynomial BPAB(F) for F(X) over [A,B] is an approximant, 
%    not an interpolant; in other words, its value is not guaranteed to equal
%    that of F at any particular point.  However, for a fixed interval
%    [A,B], if we let N increase, the Bernstein polynomial converges
%    uniformly to F everywhere in [A,B], provided only that F is continuous.
%    Even if F is not continuous, but is bounded, the polynomial converges
%    pointwise to F(X) at all points of continuity.  On the other hand,
%    the convergence is quite slow compared to other interpolation
%    and approximation schemes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, integer N, the degree of the Bernstein polynomial
%    to be used.  N must be at least 0.
%
%    Input, real A, B, the endpoints of the interval on which the
%    approximant is based.  A and B should not be equal.
%
%    Input, real YDATA(N+1), the data values at N+1 equally
%    spaced points in [A,B].  If N = 0, then the evaluation point should
%    be 0.5 * ( A + B).  Otherwise, evaluation point I should be
%    ( (N-I)*A + I*B ) / N ).
%
%    Input, integer NVAL, the number of points at which the
%    approximant is to be evaluated.
%
%    Input, real XVAL(NVAL), the point at which the Bernstein 
%    polynomial approximant is to be evaluated.  The entries of XVAL do not 
%    have to lie in the interval [A,B].
%
%    Output, real YVAL(NVAL), the values of the Bernstein 
%    polynomial approximant for F, based in [A,B], evaluated at XVAL.
%
  for i = 1 : nval
%
%  Evaluate the Bernstein basis polynomials at XVAL.
%
    bvec = bernstein_poly_ab ( n, a, b, xval(i) );
%
%  Now compute the sum of YDATA(I) * BVEC(I).
%
    yval(i) = ydata' * bvec;

  end

  return
end
