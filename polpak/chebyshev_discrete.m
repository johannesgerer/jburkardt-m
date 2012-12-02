function value = chebyshev_discrete ( n, m, x )

%*****************************************************************************80
%
%% CHEBYSHEV_DISCRETE evaluates discrete Chebyshev polynomials at a point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Walter Gautschi,
%    Orthogonal Polynomials: Computation and Approximation,
%    Oxford, 2004,
%    ISBN: 0-19-850672-4,
%    LC: QA404.5 G3555.
%
%  Parameters:
%
%    Input, integer N, the highest order of the polynomials to be evaluated.
%    0 <= N <= M.
%
%    Input, integer M, the maximum order of the polynomials.
%    0 <= M.
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE(N+1), the value of the polynomials at X.
%
  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV_DISCRETE - Fatal error!\n' );
    fprintf ( 1, '  Parameter M must be nonnegative.\n' );
    error ( 'CHEBYSHEV_DISCRETE - Fatal error!\n');
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV_DISCRETE - Fatal error!\n' );
    fprintf ( 1, '  Parameter N must be nonnegative.\n' );
    error ( 'CHARLIER - Fatal error!\n');
  end

  if ( m < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEBYSHEV_DISCRETE - Fatal error!\n' );
    fprintf ( 1, '  Parameter N must be no greater than M.\n' );
    error ( 'CHEBYSHEV_DISCRETE - Fatal error!\n');
  end

  OFFSET = 1;

  value(0+OFFSET) = 1.0;

  if ( n == 0 )
    return
  end

  value(1+OFFSET) = 2.0 * x + 1 - m;

  if ( n == 1 )
    return
  end

  for i = 1 : n - 1
    value(i+1+OFFSET) = ( ...
      ( 2 * i + 1 ) * ( 2.0 * x + 1 - m ) * value(i+OFFSET) ...
      - i * ( m + i ) * ( m - i ) * value(i-1+OFFSET) ...
    ) / ( i + 1 );
  end

  return
end
