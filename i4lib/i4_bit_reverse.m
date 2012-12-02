function value = i4_bit_reverse ( i, n )

%*****************************************************************************80
%
%% I4_BIT_REVERSE reverses the bits in an I4.
%
%  Discussion:
%
%    An I4 is an integer value.
%
%  Example:
%
%       I      N  2^N     I4_BIT_REVERSE ( I, N )
%    ----    --------  -----------------------
%       0      0    1     0
%       1      0    1     1
%
%       0      3    8     0
%       1      3    8     4
%       2      3    8     2
%       3      3    8     6
%       4      3    8     1
%       5      3    8     5
%       6      3    8     3
%       7      3    8     7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer to be bit reversed.
%    I should be nonnegative.  Normally I < 2^N.
%
%    Input, integer N, indicates the number of bits to
%    be reverse (N+1) or the base with respect to which the integer is to
%    be reversed (2^N).  N should be nonnegative.
%
%    Output, integer VALUE, the bit reversed value.
%
  i = round ( i );
  n = round ( n );

  if ( i < 0 )

    value = -1;

  elseif ( n < 0 )

    value = -1;

  else

    b = 2^n;
    j = mod ( i, b );

    value = 0;

    while ( 1 )

      if ( b == 1 )

        value = value + j;
        j = 0;
        break

      else

        if ( mod ( j, 2 ) == 1 )
          value = value + floor ( b / 2 );
          j = j - 1;
        end

        j = floor ( j / 2 );
        b = floor ( b / 2 );

      end

    end

  end

  return
end
