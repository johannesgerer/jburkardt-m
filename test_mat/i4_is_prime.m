function value = i4_is_prime ( n )

%*****************************************************************************80
%
%% I4_IS_PRIME reports whether an integer is prime.
%
%  Discussion:
%
%    A simple, unoptimized sieve of Erasthosthenes is used to
%    check whether N can be divided by any integer between 2
%    and SQRT(N).
%
%    Note that negative numbers, 0 and 1 are not considered prime.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer to be tested.
%
%    Output, logical VALUE, is TRUE if N is prime, and FALSE
%    otherwise.
%
  if ( n <= 0 )
    value = 0;
    return
  end

  if ( n == 1 )
    value = 0;
    return
  end

  if ( n <= 3 )
    value = 1;
    return
  end

  nhi = floor ( sqrt ( n ) );

  for i = 2 : nhi
    if ( mod ( n, i ) == 0 )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
