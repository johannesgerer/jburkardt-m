function value = i4_gcd ( i, j )

%*****************************************************************************80
%
%% I4_GCD finds the greatest common divisor of I and J.
%
%  Discussion:
%
%    Only the absolute values of I and J are
%    considered, so that the result is always nonnegative.
%
%    If I or J is 0, I4_GCD is returned as max ( 1, abs ( I ), abs ( J ) ).
%
%    If I and J have no common factor, I4_GCD is returned as 1.
%
%    Otherwise, using the Euclidean algorithm, I4_GCD is the
%    largest common factor of I and J.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, two numbers whose greatest common divisor
%    is desired.
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
%  Set IP to the larger of I and J, IQ to the smaller.
%  This way, we can alter IP and IQ as we go.
%
  ip = max ( abs ( i ), abs ( j ) );
  iq = min ( abs ( i ), abs ( j ) );
%
%  Carry out the Euclidean algorithm.
%
  while ( 1 )

    ir = mod ( ip, iq );

    if ( ir == 0 )
      break;
    end

    ip = iq;
    iq = ir;

  end

  value = iq;

  return
end
