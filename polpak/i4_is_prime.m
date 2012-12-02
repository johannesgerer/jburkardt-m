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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
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
%    otherwise.  Note that negative numbers and 0 are not
%    considered prime.
%
  if ( n ~= floor ( n ) )
    value = 0;
    return
  end

  if ( n <= 0 )
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
