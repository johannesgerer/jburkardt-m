function ngray = gray_code_enum ( n )

%*****************************************************************************80
%
%% GRAY_CODE_ENUM enumerates the Gray codes on N digits.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of digits in each element.
%    N must be nonnegative.
%
%    Output, integer NGRAY, the number of distinct elements.
%
  ngray = 2^n;

  return
end
