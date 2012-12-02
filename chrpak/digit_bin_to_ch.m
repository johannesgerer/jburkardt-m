function c = digit_bin_to_ch ( i )

%*****************************************************************************80
%
%% DIGIT_BIN_TO_CH returns the character representation of a binary digit.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer, between 0 and 1.
%
%    Output, character C, the character representation of the integer.
%
  if ( i == 0 )
    c = '0';
  elseif ( i == 1 )
    c = '1';
  else
    c = '*';
  end

  return
end
