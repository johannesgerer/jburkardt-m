function value = l4_to_i4 ( l )

%*****************************************************************************80
%
%% L4_TO_I4 converts an L4 to an I4.
%
%  Discussion:
%
%    0 is FALSE, and anything else if TRUE.
%
%    An I4 is an integer value.
%    An L4 is a logical value.
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
%    Input, logical L, a logical value.
%
%    Output, integer VALUE, the integer value of L.
%
  if ( l )
    value = 1;
  else
    value = 0;
  end

  return
end
