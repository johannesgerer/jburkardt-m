function s = s_control_blank ( s )

%*****************************************************************************80
%
%% S_CONTROL_BLANK replaces control characters with blanks.
%
%  Discussion:
%
%    A "control character" has ASCII code <= 31 or 127 <= ASCII code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, string S, the string to be transformed.
%
  s_length = s_len_trim ( s );

  for i = 1 : s_length
    if ( ch_is_control ( s(i) ) )
      s(i) = ' ';
    end
  end

  return
end
