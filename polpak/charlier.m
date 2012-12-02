function value = charlier ( n, a, x )

%*****************************************************************************80
%
%% CHARLIER evaluates Charlier polynomials at a point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    J Simoes Pereira,
%    Algorithm 234: Poisson-Charliers Polynomials,
%    Communications of the ACM,
%    Volume 7, Number 7, page 420, July 1964.
%
%    Walter Gautschi,
%    Orthogonal Polynomials: Computation and Approximation,
%    Oxford, 2004,
%    ISBN: 0-19-850672-4,
%    LC: QA404.5 G3555.
%
%    Gabor Szego,
%    Orthogonal Polynomials,
%    American Mathematical Society, 1975,
%    ISBN: 0821810235,
%    LC: QA3.A5.v23.
%
%    Eric Weisstein,
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 2002,
%    Second edition,
%    ISBN: 1584883472,
%    LC: QA5.W45.
%
%  Parameters:
%
%    Input, integer N, the maximum order of the polynomial.  
%    N must be at least 0.
%
%    Input, real A, the parameter.  A must not be 0.
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE(N+1), the value of the polynomials at X.
%
  if ( a == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHARLIER - Fatal error!\n' );
    fprintf ( 1, '  Parameter A cannot be zero.\n' );
    error ( 'CHARLIER - Fatal error!\n');
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHARLIER - Fatal error!\n' );
    fprintf ( 1, '  Parameter N must be nonnegative.\n' );
    error ( 'CHARLIER - Fatal error!\n');
  end

  value = zeros ( n + 1, 1 );

  OFFSET = 1;

  value(0+OFFSET) = 1.0;

  if ( n == 0 )
    return
  end

  value(1+OFFSET) = - x / a;

  if ( n == 1 )
    return
  end

  for i = 1 : n - 1
    value(i+1+OFFSET) = ( ( i + a - x ) * value(i+OFFSET) - i * value(i-1+OFFSET) ) / a;
  end

  return
end
