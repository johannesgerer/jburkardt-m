function value = i4_gcd ( i, j )

%*****************************************************************************80
%
%% I4_GCD finds the greatest common divisor of I and J.
%
%  Discussion:
%
%    Note that only the absolute values of I and J are
%    considered, so that the result is always nonnegative.
%
%    If I or J is 0, I4_GCD is returned as max ( 1, abs ( I ), abs ( J ) ).
%
%    If I and J have no common factor, I4_GCD is returned as 1.
%
%    Otherwise, using the Euclidean algorithm, I4_GCD is the
%    greatest common divisor of I and J.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, two numbers whose GCD is desired.
%
%    Output, integer VALUE, the greatest common divisor of I and J.
%
  value = 1;
%
%  Return immediately if either I or J is zero.
%
  if ( i == 0 )
    value = max ( 1, abs ( j ) );
    return
  elseif ( j == 0 )
    value = max ( 1, abs ( i ) );
    return
  end
%
%  Set P to the larger of I and J, Q to the smaller.
%  This way, we can alter P and Q as we go.
%
  p = max ( abs ( i ), abs ( j ) );
  q = min ( abs ( i ), abs ( j ) );
%
%  Carry out the Euclidean algorithm.
%
  while ( 1 )

    r = mod ( p, q );

    if ( abs ( r ) < 1 )
      break
    end

    p = q;
    q = r;

  end

  value = q;

  return
end
