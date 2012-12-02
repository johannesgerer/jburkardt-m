function [ y, m ] = month_borrow_gregorian ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_GREGORIAN borrows a year of months on the Gregorian calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%
  while ( m <= 0 )

    months = year_length_months_gregorian ( y );

    m = m + months;
    y = y - 1;

    if ( y == 0 )
      y = - 1;
    end

  end

  return
end
