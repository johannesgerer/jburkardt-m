function [ alpha, rlogl, v, g, niter, s, epsilon, ifault ] = ...
  dirichlet_estimate ( k, n, x, ix, init, alpha )

%*****************************************************************************80
%
%% DIRICHLET_ESTIMATE estimates the parameters of a Dirichlet distribution.
%
%  Discussion:
%
%    This routine requires several auxilliary routines:
%
%      ALOGAM (CACM algorithm 291 or AS 245),
%      DIGAMA (AS 103),
%      GAMMAD (AS 239),
%      PPCHI2 (AS 91),
%      TRIGAM (AS 121).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 1999
%
%  Author:
%
%    Original FORTRAN77 version by A Naryanan.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A. Naryanan,
%    Algorithm AS 266:
%    Maximum Likelihood Estimation of the Parameters of the
%    Dirichlet Distribution,
%    Applied Statistics,
%    Volume 40, Number 2, 1991, pages 365-374.
%
%  Parameters:
%
%    Input, integer K, the number of parameters.
%    2 <= K.
%
%    Input, integer N, the number of observations.
%    K < N.
%
%    Input, real X(IX,K), contains the N by K array of samples
%    from the distribution.  X(I,J) is the J-th component of
%    the I-th sample.
%
%    Input, integer IX, the leading dimension of the array X.
%    N <= IX.
%
%    Input, integer INIT, specifies how the parameter estimates
%    are to be initialized:
%    1, use the method of moments;
%    2, initialize each ALPHA to the minimum of X;
%    otherwise, the input values of ALPHA already contain estimates.
%
%    Input/output, real ALPHA(K).
%    On input, if INIT is not 1 or 2, then ALPHA must contain
%    initial estimates for the parameters.
%    On output, with IFAULT = 0, ALPHA contains the computed
%    estimates for the parameters.
%
%    Output, real RLOGL, the value of the log-likelihood function
%    at the solution point.
%
%    Output, real V(K*(K+1)/2); V(J*(J-1)/2+I) contains the covariance
%    between ALPHA(I) and ALPHA(J), for I = 1 to J, J = 1 to K.
%
%    Output, real G(K), contains an estimate of the derivative of
%    the log-likelihood with respect to each component of ALPHA.
%
%    Output, integer NITER, contains the number of Newton-Raphson
%    iterations performed.
%
%    Output, real S, the value of the chi-squared statistic.
%
%    Output, real EPSILON, contains the probability that the chi-squared
%    statistic is less than S.
%
%    Output, integer IFAULT, error indicator.
%    0, no error, the results were computed successfully;
%    1, K < 2;
%    2, N <= K;
%    3, IX < N;
%    4, if X(I,J) <= 0 for any I or J, or if
%       ABS ( Sum ( 1 <= J <= K ) X(I,J) - 1 ) >= GAMMA = 0.001;
%    5, if IFAULT is returned nonzero from the chi-square
%       routine PPCHI2;
%    6, if ALPHA(J) <= 0 for any J during any step of the iteration;
%    7, if MAXIT iterations were carried out but convergence
%       was not achieved.
%
  alpha_min = 0.00001;
  gamma = 0.0001;
  it_max = 100;
  ifault2 = 0;
%
%  Check the input arguments.
%
  if ( k < 2 )
    ifault = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
    fprintf ( 1, '  K < 2.\n' );
    error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
  end

  if ( n <= k )
    ifault = 2;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
    fprintf ( 1, '  N <= K.\n' );
    error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
  end

  if ( ix < n )
    ifault = 3;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
    fprintf ( 1, '  IX < N.\n' );
    error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
  end

  for i = 1 : n

    for j = 1 : k
      if ( x(i,j) <= 0.0 )
        niter = i;
        ifault = 4;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
        fprintf ( 1, '  X(I,J) <= 0.\n' );
        error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
      end
    end

    sum2 = sum ( x(i,1:k) );

    if ( gamma <= abs ( sum2 - 1.0 ) )
      ifault = 4;
      niter = i;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
      fprintf ( 1, '  Row I does not sum to 1.\n' );
      error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
    end

  end

  ifault = 0;

  an = n;
  rk = k;
  niter = 0;
%
%  Calculate initial estimates using the method of moments.
%
  if ( init == 1 )

    for j = 1 : k - 1
      alpha(j) = sum ( x(1:n,j) ) / an;
    end

    alpha(k) = 1.0 - sum ( alpha(1:k-1) );

    x12 = 0.0;
    for i = 1 : n
      x12 = x12 + x(i,1) * x(i,1);
    end

    x12 = x12 / an;
    varp1 = x12 - alpha(1) * alpha(1);

    x11 = ( alpha(1) - x12 ) / varp1;
    alpha(1:k) = x11 * alpha(1:k);
%
%  Calculate initial estimates using Ronning's suggestion.
%
  elseif ( init == 2 )

    x_min = x(1,1);
    for j = 1 : k
      for i = 1 : n
        x_min = min ( x_min, x(i,j) );
      end
    end

    x_min = max ( x_min, alpha_min );

    alpha(1:k) = x_min;

  end
%
%  Check whether any ALPHA's are negative or zero.
%
  for j = 1 : k
    if ( alpha(j) <= 0.0 )
      ifault = 6;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
      fprintf ( 1, '  For J = %d\n', j );
      fprintf ( 1, '  ALPHA(J) = %f\n', alpha(j) );
      fprintf ( 1, '  but ALPHA(J) must be positive.\n' );
      error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
    end
  end
%
%  Calculate N * log ( G(J) ) for J = 1,2,...,K and store in WORK array.
%
  for j = 1 : k
    work(j) = sum ( log ( x(1:n,j) ) );
  end
%
%  Call Algorithm AS 91 to compute CHI2, the chi-squared value.
%
  [ chi2, ifault ] = ppchi2 ( gamma, rk );

  if ( ifault ~= 0 )
    ifault = 5;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
    fprintf ( 1, '  PPCHI2 returns error code.\n' );
    error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
  end
%
%  Carry out the Newton iteration.
%
  for it_num = 1 : it_max

    sum2 = sum ( alpha(1:k) );

    sum1 = 0.0;
    for j = 1 : k
      work(k+j) = trigamma ( alpha(j) );
      sum1 = sum1 + 1.0 / work(k+j);
    end

    beta = trigamma ( sum2 );
    beta = an * beta / ( 1.0 - beta * sum1 );

    temp = digamma ( sum2 );

    for j = 1 : k
      g(j) = an * ( temp - digamma ( alpha(j) ) ) + work(j);
    end
%
%  Calculate the lower triangle of the Variance-Covariance matrix V.
%
    sum2 = beta / an / an;
    for i = 1 : k
      for j = 1 : i
        kk = j + ( i * ( i - 1 ) ) / 2;
        v(kk) = sum2 / ( work(k+i) * work(k+j) );
        if ( i == j )
          v(kk) = v(kk) + 1.0 / ( an * work(k+j) );
        end
      end
    end
%
%  Postmultiply the Variance-Covariance matrix V by G and store
%  in the last K elements of WORK.
%
    for i = 1 : k

      sum2 = 0.0;
      i2 = ( i * ( i - 1 ) ) / 2;
      for j = 1 : i - 1
        sum2 = sum2 + v(i2+j) * g(j);
      end
      for j = i + 1 : k
        sum2 = sum2 + v(i+(j*(j-1))/2) * g(j);
      end

      work(k+i) = sum2 + v((i*(i+1))/2) * g(i);

    end
%
%  Update the ALPHA's.
%
    niter = it_num;

    for j = 1 : k
      alpha(j) = alpha(j) + work(k+j);
      alpha(j) = max ( alpha(j), alpha_min );
    end

    for j = 1 : k
      if ( alpha(j) <= 0.0 )
        ifault = 6;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
        fprintf ( 1, '  Newton iteration %d\n', it_num );
        fprintf ( 1, '  Computed ALPHA(J) <= 0.\n' );
        fprintf ( 1, '  J = %d\n', j );
        fprintf ( 1, '  ALPHA(J) = %f\n', alpha(j) );
        error ( 'DIRICHLET_ESTIMATE - Fatal error!' )
      end
    end
%
%  Test for convergence.
%
    s = 0.0;
    for i = 1 : k
      s = s + g(i) * work(k+i);
    end

    if ( s < chi2 )

      [ epsilon, ifault2 ] = gammad ( s / 2.0, rk / 2.0 );

      sum2 = sum ( alpha(1:k) );

      rlogl = 0.0;
      for j = 1 : k
        [ value, ifault2 ] = alngam ( alpha(j) );
        rlogl = rlogl + ( alpha(j) - 1.0 ) * work(j) - an * value;
      end

      [ value, ifault2 ] = alngam ( sum2 );
      rlogl = rlogl + an * value;

      return

    end

  end

  ifault = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
  fprintf ( 1, '  No convergence.\n' );

  stop
end
