function value = i4_is_power_of_2 ( n )

%*****************************************************************************80
%
%% I4_IS_POWER_OF_2 reports whether an integer is a power of 2.
%
%  Discussion:
%
%    The powers of 2 are 1, 2, 4, 8, 16, and so on.
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
%    Output, logical VALUE, is TRUE if N is a power of 2.
%
  value = 0;

  if ( n <= 0 )
    return
  end

  while ( n ~= 1 )

    if ( mod ( n, 2 ) == 1 )
      return
    end

    floor ( n = n / 2 );

  end

  value = 1;

  return
end
