function s_new = s_replace_ch_by_s ( s_old, c, s_rep )

%*****************************************************************************80
%
%% S_REPLACE_CH_BY_S replaces all occurrences of a character by a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S_OLD, the string to be modified.
%
%    Input, character C, the character to be replaced.
%
%    Input, string S_REP, the replacement string.
%
%    Output, string S_NEW, the modified string.
%
  n_old = length ( s_old );
  n_rep = length ( s_rep );
  
  i_new = 1;
  
  for i_old = 1 : n_old

    if ( s_old(i_old) ~= c )
      s_new(i_new) = s_old(i_old);
      i_new = i_new + 1;
    else
      s_new(i_new:i_new+n_rep-1) = s_rep;
      i_new = i_new + n_rep;
    end

  end

  return
end
