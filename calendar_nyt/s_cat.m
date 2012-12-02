function s3 = s_cat ( s1, s2 )

%*****************************************************************************80
%
%% S_CAT concatenates two strings to make a third string.
%
%  Discussion:
%
%    MATLAB provides the STRCAT function, which you should 
%    probably use instead of this function!
%
%    s3 = strcat ( s1, s2 )
%
%    Although STRCAT does not ignore trailing blanks.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the "prefix" string.
%
%    Input, string S2, the "postfix" string.
%
%    Output, string S3, the string made by
%    concatenating S1 and S2, ignoring any trailing blanks.
%
  l1 = s_len_trim ( s1 );
  l2 = s_len_trim ( s2 );
%
%  The following line essentially "declares" S3 to be a
%  character string.  Omitting this line would cause S3
%  to be regarded as a numeric array.
%
  s3 = '';
%
%  Now copy the strings.
%
  s3(   1:l1   ) = s1(1:l1);
  s3(l1+1:l1+l2) = s2(1:l2);

  return
end
