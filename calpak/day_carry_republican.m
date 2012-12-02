function [ y, m, d ] = day_carry_republican ( y, m, d )

%*****************************************************************************80
%
%% DAY_CARRY_REPUBLICAN carries days to months in a Republican date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, the YMD date.
%    On output, D is between 1 and the number of days in M.
%
  days = month_length_republican ( y, m );

  while ( days < d )

    d = d - days;
    m = m + 1;
    days = month_length_republican ( y, m );
%
%  Make sure the month isn't too big.
%
    [ y, m ] = month_carry_republican ( y, m );

  end

  return
end
