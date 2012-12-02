function s32 = i4_to_s32 ( i4 )

%*****************************************************************************80
%
%% I4_TO_S32 converts an I4 to an S32.
%
%  Discussion:
%
%    An I4 is a 32 bit integer.
%
%    An S32 is a 32 character string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, the integer to be coded.
%
%    Output, string S32, the string.
%
  s32 = [];

  i4_copy = abs ( i4 );
%
%  Binary digits:
%
  for i = 32 : -1 : 2

    if ( mod ( i4_copy, i4_two ) == 1 )
      s32 = strcat ( '1', s32 );
    else
      s32 = strcat ( '0', s32 );
    end

    i4_copy = floor ( i4_copy / 2 );

  end
%
%  Sign bit
%
  s32 = strcat ( '0', s32 );
%
%  If original number was negative, then reverse all bits.
%
  if ( i4 < 0 )
    for i = 1 : 32
      if ( s32(i) == '0' )
        s32(i) = '1';
      else
        s32(i) = '0';
      end
    end
  end

  return
end
