function value = meixner ( n, beta, c, x )

%*****************************************************************************80
%
%% MEIXNER evaluates Meixner polynomials at a point.
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
%    Input, integer N, the maximum order of the polynomial.  
%    N must be at least 0.
%
%    Input, real BETA, the Beta parameter.  0 < BETA.
%
%    Input, real C, the C parameter.  0 < C < 1.
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE(N+1), the value of the polynomials at X.
%
  if ( beta <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEIXNER - Fatal error!\n' );
    fprintf ( 1, '  Parameter BETA must be positive.\n' );
    error ( 'MEIXNER - Fatal error!\n');
  end

  if ( c <= 0.0 || 1.0 <= c )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEIXNER - Fatal error!\n' );
    fprintf ( 1, '  Parameter C must be strictly between 0 and 1.\n' );
    error ( 'MEIXNER - Fatal error!\n');
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEIXNER - Fatal error!\n' );
    fprintf ( 1, '  Parameter N must be nonnegative.\n' );
    error ( 'MEIXNER - Fatal error!\n');
  end

  OFFSET = 1;

  value(0+OFFSET) = 1.0;

  if ( n == 0 )
    return
  end

  value(1+OFFSET) = ( c - 1 ) * x / beta / c + 1.0;

  if ( n == 1 )
    return
  end

  for i = 1 : n - 1
    value(i+1+OFFSET) = ( ...
      ( ( c - 1.0 ) * x + ( 1.0 + c ) * i + beta * c ) * value(i+OFFSET) ...
      - i * value(i-1+OFFSET) ...
      ) / ( i + beta );
  end

  return
end
