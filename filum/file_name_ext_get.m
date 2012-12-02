function [ i, j ] = file_name_ext_get ( file_name )

%*****************************************************************************80
%
%% FILE_NAME_EXT_GET determines the "extension" of a file name.
%
%  Discussion:
%
%    The "extension" of a filename is the string of characters
%    that appears after the LAST period in the name.  A file
%    with no period, or with a period as the last character
%    in the name, has a "null" extension.
%
%    Blanks are unusual in filenames.  This routine ignores all
%    trailing blanks, but will treat initial or internal blanks
%    as regular characters acceptable in a file name.
%
%    If no period occurs in FILE_NAME, then
%      I = J = -1;
%    Otherwise,
%      I is the position of the LAST period in FILE_NAME, and J is the
%      position of the last nonblank character following the period.
%
%  Example:
%
%    FILE_NAME   I  J
%
%    bob.for     4  7
%    N.B.C.D     6  7
%    Naomi.      6  6
%    Arthur     -1 -1
%    .com        1  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, a file name to be examined.
%
%    Output, integer I, J, the indices of the first and last characters
%    in the file extension.
%
  i = ch_index_last ( file_name, '.' )

  if ( i == -1 )

    j = -1;

  else

    j = s_len_trim ( file_name );

  end

  return
end
