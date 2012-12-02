function value = year_is_leap_alexandrian ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_ALEXANDRIAN: TRUE if the Alexandrian year was a leap year.
%
%  Discussion:
%
%    The Alexandrian year, which started on the 29th of August of the Julian
%    year, was a leap year if it included the bissextile day of the Julian
%    calendar.  In other words, if the Alexandrian year BEGAN in a Julian year
%    that preceded a Julian leap year, then the Alexandrian year was a leap
%    year.
%
%    We deem year AX 1 to have begun in Julian 23 BC.  Julian 21 BC was
%    theoretically a leap year, so AX 2 was a leap year, as was AX 6, AX 10,
%    and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical YEAR_IS_LEAP_ALEXANDRIAN, TRUE if the year was a leap year.
%
  if ( mod ( y, 4 ) == 2 )
    value = 1;
  else
    value = 0;
  end

  return
end
