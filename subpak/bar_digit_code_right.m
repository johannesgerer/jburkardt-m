function coder = bar_digit_code_right ( digit )

%*****************************************************************************80
%
%% BAR_DIGIT_CODE_RIGHT returns the 7 character right bar code for a digit.
%
%  Example:
%
%    DIGIT = 3
%    CODER = '1000010'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIGIT, the digit, between 0 and 9.
%
%    Output, character CODER(7), the right code for the digit.
%
  if ( digit == 0 ) 
    coder = '1110010';
  elseif ( digit == 1 ) 
    coder = '1100110';
  elseif ( digit == 2 ) 
    coder = '1101100';
  elseif ( digit == 3 ) 
    coder = '1000010';
  elseif ( digit == 4 ) 
    coder = '1011100';
  elseif ( digit == 5 ) 
    coder = '1001110';
  elseif ( digit == 6 ) 
    coder = '1010000';
  elseif ( digit == 7 ) 
    coder = '1000100';
  elseif ( digit == 8 ) 
    coder = '1001000';
  elseif ( digit == 9 ) 
    coder = '1110100';
  else
    coder = '???????';
  end

  return
end
