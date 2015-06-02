function value = s_scrabble_points ( s )

%*****************************************************************************80
%
%% S_SCRABBLE_POINTS returns the Scrabble point value of a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string.
%
%    Output, integer S_SCRABBLE_POINTS, the point value of
%    the string.
%
  s_length = length ( s );

  value = 0;
  for i = 1 : s_length
    value = value + ch_scrabble_points ( s(i:i) );
  end

  return
end