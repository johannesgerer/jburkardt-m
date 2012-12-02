function value = i4_to_l ( i4 )

%*****************************************************************************80
%
%% I4_TO_L converts an I4 to a logical value.
%
%  Discussion:
%
%    0 is FALSE, and anything else if TRUE.
%
%    An I4 is an integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, an integer.
%
%    Output, logical I4_TO_L, the logical value of I4.
%
  value = ( i4 ~= 0 );

  return
end
