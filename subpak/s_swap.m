function [ s1, s2 ] = s_swap ( s1, s2 )

%*****************************************************************************80
%
%% S_SWAP swaps two strings.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, two strings.
%
%    Output, string S1, S2, the interchanged strings.
%
  s3 = s1;
  s1 = s2;
  s2 = s3;

  return
end
