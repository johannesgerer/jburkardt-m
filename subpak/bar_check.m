function check = bar_check ( digit )

%*****************************************************************************80
%
%% BAR_CHECK computes the check digit for a barcode.
%
%  Discussion:
%
%    CHECK = SUM ( I = 1, 11, by 2's ) DIGIT(I)
%       + 3 * SUM ( I = 2, 10, by 2's ) DIGIT(I)
%
%    CHECK = MOD ( 10 - MOD ( CHECK, 10 ), 10 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIGIT(12), entries 1 through 11 of DIGIT contain
%    the digits of the bar code.  Each entry must be between 0 and 9.
%    The 12th digit should be the check digit.
%
%    Output, integer CHECK, the correct check digit.  If the bar code
%    is correct, then DIGIT(12) should equal CHECK.
%
  check = sum ( digit(1:2:11) ) + 3 * sum ( digit(2:2:10) );

  check = mod ( 10 - mod ( check, 10 ), 10 );

  return
end
