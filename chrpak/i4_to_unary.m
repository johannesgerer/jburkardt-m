function s = i4_to_unary ( intval )

%*****************************************************************************80
%
%% I4_TO_UNARY produces the "base 1" representation of an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INTVAL, an integer to be represented.
%
%    Output, string S, the unary representation.
%
  if ( intval == 0 )
    s = '0';
  elseif ( intval < 0 )
    s(1) = '-';
    s(2:1-intval) = '1';
  else
    s(1:intval) = '1';
  end

  s = char ( s );

  return
end
