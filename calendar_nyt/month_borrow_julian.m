function [ y, m ] = month_borrow_julian ( y, m )

%*****************************************************************************80
%
%% MONTH_BORROW_JULIAN borrows a year of months on the Julian calendar.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, integer M, the YM date.
%
%    Output, integer Y, integer M, the YM date.
%
  while ( m <= 0 )

    months = year_length_months_julian ( y );

    m = m + months;
    y = y - 1;

    if ( y == 0 )
      y = - 1;
    end

  end

  return
end
