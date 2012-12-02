function value ch_is_alphanumeric ( c )

%*****************************************************************************80
%
%% CH_IS_ALPHANUMERIC = the character C is alphanumeric.
%
%  Discussion:
%
%    Alphanumeric characters are 'A' through 'Z', 'a' through 'z' and
%    '0' through '9'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to be checked.
%
%    Output, logical VALUE, is TRUE if the character is
%    alphabetic or numeric.
% 
  if ( ( 'a' <= i && i <= 'z' ) || ...
       ( 'A' <= i && i <= 'Z' ) || ...
       ( '0' <= i && i <= '9' ) )

    value = 1;

  else

    value = 0;

  end

  return
end
