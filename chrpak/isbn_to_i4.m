function value = isbn_to_i4 ( c )

%*****************************************************************************80
%
%% ISBN_TO_I4 converts an ISBN character into an integer.
%
%  Discussion:
%
%    The characters '0' through '9' stand for themselves, but
%    the character 'X' or 'x' stands for 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Book Industry Study Group,
%    The Evolution in Product Identification:
%    Sunrise 2005 and the ISBN-13,
%    http://www.bisg.org/docs/The_Evolution_in_Product_ID.pdf
%
%  Parameters:
%
%    Input, character C, the ISBN character code to be converted.
%
%    Output, integer VALUE, the numeric value of the character
%    code, between 0 and 10.  This value is returned as -1 if C is
%    not a valid character code.
%
       if ( c == '0' )
    value = 0;
  elseif ( c == '1' )
    value = 1;
  elseif ( c == '2' )
    value = 2;
  elseif ( c == '3' )
    value = 3;
  elseif ( c == '4' )
    value = 4;
  elseif ( c == '5' )
    value = 5;
  elseif ( c == '6' )
    value = 6;
  elseif ( c == '7' )
    value = 7;
  elseif ( c == '8' )
    value = 8;
  elseif ( c == '9' )
    value = 9;
  elseif ( c == 'X' | c == 'x' )
    value = 10;
  else
    value = -1;
  end

  return
end
