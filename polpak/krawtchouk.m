function v = krawtchouk ( n, p, x, m )

%*****************************************************************************80
%
%% KRAWTCHOUK evaluates the Krawtchouk polynomials at X.
%
%  Discussion:
%
%    The polynomial has a parameter P, which must be striclty between
%    0 and 1, and a parameter M which must be a nonnegative integer.
%
%    The Krawtchouk polynomial of order N, with parameters P and M,
%    evaluated at X, may be written K(N,P,X,M).
%
%    The first two terms are:
%
%      K(0,P,X,M) = 1
%      K(1,P,X,M) = X - P * M
%
%    and the recursion, for fixed P and M is
%
%                             ( N + 1 ) * K(N+1,P,X,M) =
%        ( X - ( N + P * ( M - 2 * N))) * K(N,  P,X,M)
%       - ( M - N + 1 ) * P * ( 1 - P ) * K(N-1,P,X,M)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2010
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
%    Input, integer N, the highest order polynomial to evaluate.
%    0 <= N.
%
%    Input, real P, the parameter.  0 < P < 1.
%
%    Input, real X, the evaluation parameter.
%
%    Input, integer M, the parameter.  0 <= M.
%
%    Output, real V(1:N+1), the values of the Krawtchouk polynomials
%    of orders 0 through N at X.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KRAWTCHOUK - Fatal error!\n' );
    fprintf ( 1, '  0 <= N is required.\n' );
    error ( 'KRAWTCHOUK - Fatal error!' );
    return
  end

  if ( p <= 0.0 || 1.0 <= p )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KRAWTCHOUK - Fatal error!\n' );
    fprintf ( 1, '  0 < P < 1 is required.\n' );
    error ( 'KRAWTCHOUK - Fatal error!' );
    return
  end

  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KRAWTCHOUK - Fatal error!\n' );
    fprintf ( 1, '  0 <= M is required.\n' );
    error ( 'KRAWTCHOUK - Fatal error!' );
    return
  end

  OFFSET = 1;

  v = zeros(n+1,1);
  v(0+OFFSET) = 1.0;

  if ( 1 <= n )
    v(1+OFFSET) = x - p * m;
  end

  for i = 1 : n - 1
    v(i+1+OFFSET) = ( ( x - ( i + p * ( m - 2 * i ) ) ) * v(i+OFFSET) ...
                        - ( m - i + 1 ) * p * ( 1 - p ) * v(i-1+OFFSET)  ) ...
                    / ( i + 1 );
  end

  return
end
