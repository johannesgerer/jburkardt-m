function [ bar, digit ] = bar_code ( digit )

%*****************************************************************************80
%
%% BAR_CODE constructs the 113 character barcode from 11 digits.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIGIT(11), a code to be turned into a barcode.
%
%    Output, character( len = 113 ) BAR, the bar code corresponding to the
%    digit information.
%
%    Output, integer DIGIT(12), the first 11 entries are unchanged,
%    the 12-th entry of DIGIT is a check digit.
%

%
%  9 character quiet zone.
%
  bar(1:9) = '000000000';
%
%  3 character guard pattern.
%
  bar(10:12) = '101';
%
%  7 character product category.
%
  bar(13:19) = bar_digit_code_left ( digit(1) );
%
%  35 characters contain the 5 digit manufacturer code.
%
  for i = 1 : 5
    bar(20+(i-1)*7:20+(i-1)*7+6) = bar_digit_code_left ( digit(i+1) );
  end
%
%  Center guard pattern.
%
  bar(55:59) = '01010';
%
%  35 characters contain the 5 digit product code.
%
  for i = 1 : 5
    bar(60+(i-1)*7:60+(i-1)*7+6) = bar_digit_code_right ( digit(i+6) );
  end
%
%  Compute the check digit.
%
  digit(12) = bar_check ( digit );

  bar(95:101) = bar_digit_code_right ( digit(12) );
%
%  Guard pattern.
%
  bar(102:104) = '101';
%
%  Quiet zone.
%
  bar(105:113) = '000000000';

  return
end
