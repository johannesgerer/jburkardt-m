function s = number_inc ( s )

%*****************************************************************************80
%
%% NUMBER_INC increments the integer represented by a string.
%
%  Example:
%
%    Input      Output
%    -----      ------
%    '17'       '18'
%    'cat3'     'cat4'
%    '2for9'    '3for0'
%    '99thump'  '00thump'
%
%  Discussion:
%
%    If the string contains characters that are not digits, they will
%    simply be ignored.  If the integer is all 9's on input, then
%    the output will be all 0's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string representing an integer.
%
%    Output, string S, the incremented string.
%
  lens = s_len_trim ( s );

  for i = lens : -1 : 1

    if ( ch_is_digit ( s(i) ) )

      s(i) = digit_inc ( s(i) );

      if ( s(i) ~= '0' )
        return
      end

    end

  end

  return
end
