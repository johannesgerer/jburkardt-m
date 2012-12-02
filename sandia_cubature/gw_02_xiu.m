function [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d )

%*****************************************************************************80
%
%% GW_02_XIU implements the Golub-Welsch version of the Xiu rule.
%
%  Discussion:
%
%    The rule has order
%
%      O = N + 1.
%
%    The rule has precision P = 2.
%
%    It is assumed that the integral is over an N-dimensional region,
%    and has the form
%
%      Integral f(x) w(x) dx
%
%    where w(x) is separable into identical and independent components:
%
%      w(x) = v(x1) * v(x2) * ... * v(xn)
%
%    Associated with the weight function v(x), we assume there is a
%    family of orthogonal polynomials satisfying a three-term recurrence
%    of the form:
%
%      x P(n,x) = An * P(n+1,x) + Bn * P(n,x) + Cn * P(n-1,x)
%
%    with P(0,x) = 1, and P(-1,x) = 0.
%
%    This routine can construct the desired quadrature rule by knowing
%    the values of C1, used in the definition of P2, the values
%    GAMMA0 = 1/A0 and DELTA0 = - B0/A0, for which it is the case that
%    P(1,X) = GAMMA0 * X + DELTA0, and the value of VOLUME_1D, that is,
%    the 1D integral of v(x) over the region.
%
%    Note the values for the following standard polynomial families:
%
%    Chebyshev Type 1
%      V(X) =      1 / sqrt ( 1 - X^2 )
%      Interval =  [-1,+1]
%      GAMMA0 =    1.0
%      DELTA0 =    0.0
%      C1 =        1/2
%      VOLUME_1D = PI
%
%    Chebyshev Type 2
%      V(X) =      sqrt ( 1 - X^2 )
%      Interval =  [-1,+1]
%      GAMMA0 =    2.0
%      DELTA0 =    0.0
%      C1 =        1/2
%      VOLUME_1D = PI / 2
%
%    Gegenbauer
%      V(X) =      ( 1 - X^2 )^A
%      Interval =  [-1,+1]
%      GAMMA0 =    2 * A + 1
%      DELTA0 =    0.0
%      C1 =        ( 2 * A + 1 ) / ( 2 A + 3 )
%      VOLUME_1D = sqrt ( PI ) * Gamma(A+1) / Gamma(A+3/2)
%
%    Gegenbauer* (Removes singularity at ALPHA = -0.5):
%      V(X) =      ( 1 - X^2 )^A
%      Interval =  [-1,+1]
%      GAMMA0 =    1
%      DELTA0 =    0.0
%      C1 =        1 / ( 2 A + 3 )
%      VOLUME_1D = sqrt ( PI ) * Gamma(A+1) / Gamma(A+3/2)
%
%    Generalized Hermite
%      V(X) = |x|^A exp ( - x^2 )
%      Interval = (-oo,+oo)
%      GAMMA0 =    2
%      DELTA0 =    0
%      C1 =        2+2A
%      VOLUME_1D = Gamma((A+1)/2)
%
%    Generalized Laguerre
%      V(X) =       x^A exp ( - x )
%      Interval =  [0,+oo)
%      GAMMA0 =    -1.0
%      DELTA0 =     A+1.0
%      C1 =        -A-1.0
%      VOLUME_1D =  Gamma(A+1)
%
%    Hermite (physicist)
%      V(X) =      exp ( - x^2 )
%      Interval =  (-oo,+oo)
%      GAMMA0 =    2.0
%      DELTA0 =    0.0
%      C1 =        1.0
%      VOLUME_1D = sqrt ( PI )
%
%    Hermite (probabilist)
%      V(X) =      exp ( - x^2 / 2 )
%      Interval =  (-oo,+oo)
%      GAMMA0 =    1.0
%      DELTA0 =    0.0
%      C1 =        1.0
%      VOLUME_1D = sqrt ( 2 PI )
%
%    Jacobi
%      V(X) =      (1-x)^A (1+x)^B
%      Interval =  [-1,+1]
%      GAMMA0 =    (A+B+2)/2
%      DELTA0 =    (A-B)/2
%      C1 =        2(A+1)(B+1)/(A+B+3)/(A+B+2)
%      VOLUME_1D = 2^(A+B+1) * Gamma(A+1) * Gamma(B+1) / ( A+B+1) / Gamma(A+B+1)
%
%    Laguerre
%      V(X) =       exp ( - x )
%      Interval =  [0,+oo)
%      GAMMA0 =    -1.0
%      DELTA0 =     1.0
%      C1 =        -1.0
%      VOLUME_1D =  1.0
%
%    Legendre
%      V(X) =      1.0
%      Interval =  [-1,+1]
%      GAMMA0 =    1.0
%      DELTA0 =    0.0
%      C1 =        1/3
%      VOLUME_1D = 2.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu,
%    Numerical integration formulas of degree two,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 1515-1520.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real GAMMA0, the ratio 1 / A0.
%
%    Input, real DELTA0, the ratio B0 / A0.
%
%    Input, real C1, the coefficient of P(0,X) in
%    the definition of P(2,X).
%
%    Input, real VOLUME_1D, the 1D integral of V(X).
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = n + 1;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  for j = 1 : o

    i = 0;
    for r = 1 : floor ( n / 2 )
      arg = 2 * r * ( j - 1 ) * pi / ( n + 1 );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * cos ( arg );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * sin ( arg );
    end

    if ( i < n )
      i = i + 1;
      x(i,j) = r8_mop ( j - 1 );
    end

  end
%
%  Adjust for the GW rule.
%
  x(1:n,1:o) = ( sqrt ( gamma0 * c1 ) * x(1:n,1:o) - delta0 ) / gamma0;
%
%  The weights are equal.
%
  w(1:o) = volume_1d^n  / o;

  return
end
