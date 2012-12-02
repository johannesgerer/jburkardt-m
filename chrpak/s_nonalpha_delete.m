function s_new = s_nonalpha_delete ( s )

%*****************************************************************************80
%
%% S_NONALPHA_DELETE removes nonalphabetic characters from a string.
%
%  Discussion:
%
%    The remaining characters are left justified.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be transformed.
%
%    Output, string S_NEW, the transformed string.
%
  s_len = length ( s );
  s_new = [];

  put = 0;

  for get = 1 : s_len

    if ( ch_is_alpha ( s(get) ) )
      put = put + 1;
      s_new(put) = s(get);
    end

  end

  return
end
