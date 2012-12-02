function [ y, m, d ] = day_carry_julian ( y, m, d )

%*****************************************************************************80
%
%% DAY_CARRY_JULIAN carries days to months in a Julian date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, integer M, integer D, the YMD date.
%
%    Output, integer Y, integer M, integer D, the YMD date.
%    On output, D is between 1 and the number of days in M.
%

  days = month_length_julian ( y, m );

  while ( days < d )

    d = d - days;
    m = m + 1;
    days = month_length_julian ( y, m );
%
%  Make sure the month isn't too big.
%
    [ y, m ] = month_carry_julian ( y, m );

  end

  return
end
