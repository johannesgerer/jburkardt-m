function cof = r8vec_dif ( n, h )

%*****************************************************************************80
%
%% R8VEC_DIF computes coefficients for estimating the N-th derivative.
%
%  Discussion:
%
%    The routine computes the N+1 coefficients for a centered finite difference
%    estimate of the N-th derivative of a function.
%
%    The estimate has the form
%
%      FDIF(N,X) = Sum (I = 0 to N) COF(I) * F ( X(I) )
%
%    To understand the computation of the coefficients, it is enough
%    to realize that the first difference approximation is
%
%      FDIF(1,X) = F(X+DX) - F(X-DX) ) / (2*DX)
%
%    and that the second difference approximation can be regarded as
%    the first difference approximation repeated:
%
%      FDIF(2,X) = FDIF(1,X+DX) - FDIF(1,X-DX) / (2*DX)
%         = F(X+2*DX) - 2 F(X) + F(X-2*DX) / (4*DX)
%
%    and so on for higher order differences.
%
%    Thus, the next thing to consider is the integer coefficients of
%    the sampled values of F, which are clearly the Pascal coefficients,
%    but with an alternating negative sign.  In particular, if we
%    consider row I of Pascal's triangle to have entries j = 0 through I,
%    then P(I,J) = P(I-1,J-1) - P(I-1,J), where P(*,-1) is taken to be 0,
%    and P(0,0) = 1.
%
%       1
%      -1  1
%       1 -2   1
%      -1  3  -3   1
%       1 -4   6  -4   1
%      -1  5 -10  10  -5  1
%       1 -6  15 -20  15 -6 1
%
%    Next, note that the denominator of the approximation for the
%    N-th derivative will be (2*DX)**N.
%
%    And finally, consider the location of the N+1 sampling
%    points for F:
%
%      X-N*DX, X-(N-2)*DX, X-(N-4)*DX, ..., X+(N-4)*DX, X+(N-2*DX), X+N*DX.
%
%    Thus, a formula for evaluating FDIF(N,X) is
%
%      fdif = 0.0
%      do i = 0, n
%        xi = x + (2*i-n) * h
%        fdif = fdif + cof(i) * f(xi)
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the derivative to be approximated.
%    N must be 0 or greater.
%
%    Input, real H, the half spacing between points. 
%    H must be positive.
%
%    Output, real COF(1:N+1), the coefficients needed to approximate
%    the N-th derivative of a function F.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_DIF - Fatal error!\n' );
    fprintf ( 1, '  Derivative order N = %d\n', n );
    fprintf ( 1, '  but N must be at least 0.\n' );
    error ( 'R8VEC_DIF - Fatal error!' );
  end

  if ( h <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_DIF - Fatal error!\n' );
    fprintf ( 1, '  The half sampling spacing is H = %f\n', h );
    fprintf ( 1, '  but H must be positive.\n' );
    error ( 'R8VEC_DIF - Fatal error!' );
  end

  for i = 0 : n

    cof(i+1) = 1.0;

    for j = i-1 : -1 : 1
      cof(j+1) = -cof(j+1) + cof(j);
    end

    if ( 0 < i )
      cof(1) = -cof(1);
    end

  end

  cof(1:n+1) = cof(1:n+1) / ( 2.0 * h ).^n;

  return
end
