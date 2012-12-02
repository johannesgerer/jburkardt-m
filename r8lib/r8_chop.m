function value = r8_chop ( place, x )

%*****************************************************************************80
%
%% R8_CHOP chops an R8 to a given number of binary places.
%
%  Example:
%
%    3.875 = 2 + 1 + 1/2 + 1/4 + 1/8.
%
%    The following values would be returned for the 'chopped' value of
%    3.875:
%
%    PLACE  Value
%
%       1      2
%       2      3     = 2 + 1
%       3      3.5   = 2 + 1 + 1/2
%       4      3.75  = 2 + 1 + 1/2 + 1/4
%       5+     3.875 = 2 + 1 + 1/2 + 1/4 + 1/8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PLACE, the number of binary places to preserve.
%    PLACE = 0 means return the integer part of X.
%    PLACE = 1 means return the value of X, correct to 1/2.
%    PLACE = 2 means return the value of X, correct to 1/4.
%    PLACE = -1 means return the value of X, correct to 2.
%
%    Input, real X, the number to be chopped.
%
%    Output, real VALUE, the chopped number.
%
  s = r8_sign ( x );
  x = abs ( x );
  temp = floor ( r8_log_2 ( x ) );
  fac = 2.0^( temp - place + 1 );
  value = s * ( floor ( x / fac ) ) * fac;

  return
end
