function value = agm ( a, b )

%*****************************************************************************80
%
%% AGM computes the arithmetic-geometric mean of A and B.
%
%  Discussion:
%
%    The AGM is defined for nonnegative A and B.
%
%    The AGM of numbers A and B is defined by setting
%
%      A(0) = A,
%      B(0) = B
%
%      A(N+1) = ( A(N) + B(N) ) / 2
%      B(N+1) = sqrt ( A(N) * B(N) )
%
%    The two sequences both converge to AGM(A,B).
%
%    In Mathematica, the AGM can be evaluated by
%
%      ArithmeticGeometricMean [ a, b ]
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
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input, real A, B, the arguments whose AGM is to be computed.
%
%    Output, real AGM, the arithmetic-geometric mean of A and B.
%
  it_max = 1000;

  if ( a < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'AGM - Fatal error!\n' );
    fprintf ( 1, '  Argument A < 0.\n' );
    error ( 'AGM - Fatal error!' );
  end

  if ( b < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'AGM - Fatal error!\n' );
    fprintf ( 1, '  Argument B < 0.\n' );
    error ( 'AGM - Fatal error!' );
  end

  if ( a == 0.0 || b == 0.0 )
    value = 0.0;
    return
  end

  it = 0;
  tol = 100.0 * r8_epsilon ( );

  while ( 1 )

    it = it + 1;

    c = ( a + b ) / 2.0;
    d = sqrt ( a * b );

    if ( abs ( c - d ) <= tol * ( c + d ) )
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'AGM - Warning!\n' );
      fprintf ( 1, '  No convergence.\n' );
      break
    end

    a = c;
    b = d;

  end

  value = c;

  return
end
