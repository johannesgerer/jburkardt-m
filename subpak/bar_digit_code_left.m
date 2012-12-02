function codel = bar_digit_code_left ( digit )

%*****************************************************************************80
%
%% BAR_DIGIT_CODE_LEFT returns the 7 character left bar code for a digit.
%
%  Example:
%
%    DIGIT = 3
%    CODEL = '0111101'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIGIT, the digit, between 0 and 9.
%
%    Output, character CODEL(7), the left code for the digit.
%
  if ( digit == 0 ) 
    codel = '0001101';
  elseif ( digit == 1 )
    codel = '0011001';
  elseif ( digit == 2 ) 
    codel = '0010011';
  elseif ( digit == 3 ) 
    codel = '0111101';
  elseif ( digit == 4 ) 
    codel = '0100011';
  elseif ( digit == 5 ) 
    codel = '0110001';
  elseif ( digit == 6 ) 
    codel = '0101111';
  elseif ( digit == 7 ) 
    codel = '0111011';
  elseif ( digit == 8 ) 
    codel = '0110111';
  elseif ( digit == 9 ) 
    codel = '0001011';
  else
    codel = '???????';
  end

  return
end
