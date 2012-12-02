function l = s_to_l ( s )

%*****************************************************************************80
%
%% S_TO_L reads a logical value from a string.
%
%  Discussion:
%
%    There are several ways of representing logical data that this routine
%    recognizes:
%
%      False   True
%      -----   ----
%
%      0       1
%      F       T
%      f       t
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be read.
%
%    Output, integer L, the logical value read from the string.
%
  s_length = length ( s );

  for i = 1 : s_length
    if ( s(i) == '0' || s(i) == 'F' || s(i) == 'f' )
      l = 0;
      return
    elseif ( s(i) == '1' || s(i) == 'T' || s(i) == 't' )
      l = 1;
      return
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'S_TO_L - Fatal error!\n' );
  fprintf ( 1, '  The input string did not contain logical data.\n' );
  error ( 'S_TO_L - Fatal error!' );
end
