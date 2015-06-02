function value = r8_agm ( a, b )

%*****************************************************************************80
%
%% R8_AGM computes the arithmetic-geometric mean of A and B.
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
%    27 July 2014
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
%    0 <= A, 0 <= B.
%
%    Output, real VALUE, the arithmetic-geometric mean of A and B.
%
  it_max = 1000;

  if ( a < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_AGM - Fatal error!\n' );
    fprintf ( 1, '  Argument A < 0.\n' );
    error ( 'R8_AGM - Fatal error!' );
  end

  if ( b < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_AGM - Fatal error!\n' );
    fprintf ( 1, '  Argument B < 0.\n' );
    error ( 'R8_AGM - Fatal error!' );
  end

  if ( a == 0.0 || b == 0.0 )
    value = 0.0;
    return
  end

  it = 0;
  tol = 100.0 * eps;

  a1 = a;
  b1 = b;

  while ( 1 )

    it = it + 1;

    a2 = ( a1 + b1 ) / 2.0;
    b2 = sqrt ( a1 * b1 );

    if ( abs ( a2 - b2 ) <= tol * ( a2 + b2 ) )
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_AGM - Warning!\n' );
      fprintf ( 1, '  No convergence.\n' );
      break
    end

    a1 = a2;
    b1 = b2;

  end

  value = a2;

  return
end
