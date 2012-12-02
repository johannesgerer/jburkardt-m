function value = r8_agm ( a, b )

%*****************************************************************************80
%
%% R8_AGM finds the arithmetic-geometric mean of two numbers.
%
%  Discussion:
%
%    The AGM of (A,B) is produced by the following iteration:
%
%      (A,B) -> ( (A+B)/2, SQRT(A*B) ).
%
%    The sequence of successive values of (A,B) quickly converge to the AGM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the numbers whose AGM is desired.  A and B should
%    both be non-negative.
%
%    Output, real VALUE, the AGM of the two numbers.
%
  if ( a < 0.0 )
    value = -1.0;
    return
  end

  if ( b < 0.0 )
    value = -1.0;
    return
  end

  if ( a == 0.0 | b == 0.0 )
    value = 0.0;
    return
  end

  if ( a == b )
    value = a;
    return
  end

  tol = r8_epsilon ( ) * ( a + b + 1.0 );

  a1 = a;
  b1 = b;

  while ( 1 );

    a2 = ( a1 + b1 ) / 2.0;
    b2 = sqrt ( a1 * b1 );

    if ( abs ( a2 - b2 ) < tol )
      value = ( a2 + b2 ) / 2.0;
      break;
    end

    a1 = a2;
    b1 = b2;

  end

  return
end
