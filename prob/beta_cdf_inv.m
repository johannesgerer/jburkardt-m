function x = beta_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% BETA_CDF_INV inverts the Beta CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Abernathy and Smith,
%    Algorithm 724,
%    ACM Transactions on Mathematical Software,
%    Volume 19, Number 4, December 1993, pages 481-483.
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0D+00 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Output, real X, the argument of the CDF.
%
  maxk = 20;
  error_tol = 0.0001;
  errapp = 0.01;

  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'BETA_CDF_INV - Fatal error!' );
  end
%
%  Estimate the solution.
%
  x = a / ( a + b );

  xold = 0.0;
  loopct = 2;

  while ( errapp <= abs ( ( x - xold ) / x ) & loopct ~= 0 )

    xold = x;
    loopct = loopct - 1;
%
%  CDF_X = PROB { BETA(A,B) <= X }.
%  Q = ( CDF - CDF_X ) / PDF_X.
%
    cdf_x = beta_cdf ( x, a, b );

    pdf_x = beta_pdf ( x, a, b );

    q = ( cdf - cdf_x ) / pdf_x;
%
%  D(N,K) = C(N,K) * Q**(N+K-1) / (N-1)!
%
    t = 1.0 - x;
    s1 = q * ( b - 1.0 ) / t;
    s2 = q * ( 1.0 - a ) / x;
    d(2,0+1) = s1 + s2;
    tail = d(2,0+1) * q / 2.0;
    x = x + q + tail;

    k = 3;

    while ( error_tol < abs ( tail / x ) & k <= maxk )
%
%  Find D(2,K-2).
%
      s1 = q * ( k - 2.0 ) * s1 / t;
      s2 = q * ( 2.0 - k ) * s2 / x;
      d(2,k-2+1) = s1 + s2;
%
%  Find D(3,K-3), D(4,K-4), D(5,K-5), ... , D(K-1,1).
%
      for i = 3 : k-1
        sum2 = d(2,0+1) * d(i-1,k-i+1);
        bcoeff = 1.0;
        for j = 1 : k-i
          bcoeff = bcoeff * ( k - i - j + 1 ) / j;
          sum2 = sum2 + bcoeff * d(2,j+1) * d(i-1,k-i-j+1);
        end
        d(i,k-i+1) = sum2 + d(i-1,k-i+1+1) / ( i - 1 );
      end
%
%  Compute D(K,0) and use it to expand the series.
%
      d(k,0+1) = d(2,0+1) * d(k-1,0+1) + d(k-1,1+1) / ( k - 1 );
      tail = d(k,0+1) * q / k;
      x = x + tail;
%
%  Check for divergence.
%
      if ( x <= 0.0 | 1.0 <= x )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'BETA_CDF_INV - Fatal error!\n' );
        fprintf ( 1, '  The series has diverged.\n' );
        fprintf ( 1, '  X = %f\n', x );
        x = -1.0;
        error ( 'BETA_CDF_INV - Fatal error!' );
      end

      k = k + 1;

    end

  end

  return
end
