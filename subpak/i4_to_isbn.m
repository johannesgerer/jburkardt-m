function value = i4_to_isbn ( i )

%*****************************************************************************80
%
%% I4_TO_ISBN converts an integer to an ISBN digit.
%
%  Discussion:
%
%    Only the integers 0 through 10 can be input.  The representation
%    of 10 is 'X'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2005
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
%    Input, integer I, an integer between 0 and 10.
%
%    Output, character VALUE, the ISBN character code of the integer.
%    If I is illegal, then VALUE is set to '?'.
%
       if ( i == 0 )
    value = '0';
  elseif ( i == 1 )
    value = '1';
  elseif ( i == 2 )
    value = '2';
  elseif ( i == 3 )
    value = '3';
  elseif ( i == 4 )
    value = '4';
  elseif ( i == 5 )
    value = '5';
  elseif ( i == 6 )
    value = '6';
  elseif ( i == 7 )
    value = '7';
  elseif ( i == 8 )
    value = '8';
  elseif ( i == 9 )
    value = '9';
  elseif ( i == 10 )
    value = 'X';
  else
    value = '?';
  end

  return
end
