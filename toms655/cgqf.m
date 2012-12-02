function [ t, wts ] = cgqf ( nt, kind, alpha, beta, a, b )

%*****************************************************************************80
%
%% CGQF computes knots and weights of a Gauss quadrature formula.
%
%  Discussion:
%
%    The user may specify the interval (A,B).
%
%    Only simple knots are produced.
%
%    The user may request that the routine print the knots and weights,
%    and perform a moment check.
%
%    Use routine EIQFS to evaluate this quadrature formula.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer NT, the number of knots.
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev Type 1,     (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,+oo)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-oo,+oo)   |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,+oo)     (x-a)^alpha*(x+b)^beta
%    9, Chebyshev Type 2,     (a,b)       ((b-x)*(x-a))^(+0.5)
%
%    Input, real ALPHA, the value of Alpha, if needed.
%
%    Input, real BETA, the value of Beta, if needed.
%
%    Input, real A, B, the interval endpoints.
%
%    Output, real T(NT), the knots.
%
%    Output, real WTS(NT), the weights.
%

%
%  Compute the Gauss quadrature formula for default values of A and B.
%
  [ t, wts ] = cdgqf ( nt, kind, alpha, beta );
%
%  All knots have multiplicity = 1.
%
  mlt = zeros(nt,1);
  mlt(1:nt) = 1;
%
%  NDX(I) = I.
%
  ndx = ( 1 : nt );
%
%  Scale the quadrature rule.
%
  [ t, wts ] = scqf ( nt, t, mlt, wts, nt, ndx, kind, alpha, beta, a, b );

  return
end
