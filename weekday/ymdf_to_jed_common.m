function jed = ymdf_to_jed_common ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_COMMON converts a Common YMDF date to a JED.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    day JED = 2299160, and Gregorian from day JED = 2299161 and after.
%
%    The Julian Ephemeris Date is essentially a count of the number
%    of days that have elapsed since noon, 1 January 4713 BC, at
%    Greenwich, England.  Strictly speaking, the Julian Ephemeris Date
%    is counted from noon, and thus day "0" began at noon on 1 January 4713 BC,
%    and ended at noon on 2 January 4713 BC.
%
%    The Julian Ephemeris Date was devised by Joseph Scaliger in 1583.
%
%    The Julian Ephemeris Date has been adopted by astronomers as
%    a convenient reference for dates.
%
%  Example:
%
%       Y   M     D         JED
%    --------------     -------
%    BC 4713 Jan  1           0
%    AD 1968 May 23     2440000
%    AD 1984 Dec 31     2446065
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the Julian Ephemeris Date.
%

%
%  Copy the month and year.
%
  y2 = 1582;
  m2 = 10;
  d2 = 4+1;
  f2 = 0.0;

  cmp = ymdf_compare ( y, m, d, f, y2, m2, d2, f2 );

  if ( cmp == '<' )
    jed = ymdf_to_jed_julian ( y, m, d, f );
    return
  end
%
%  Use the Gregorian calendar for dates strictly after 1752/9/13.
%
  y2 = 1582;
  m2 = 10;
  d2 = 15-1;
  f2 = 0.0;

  cmp = ymdf_compare ( y, m, d, f, y2, m2, d2, f2 );

  if ( cmp == '>' )
    jed = ymdf_to_jed_gregorian ( y, m, d, f );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'YMDF_TO_JED_COMMON - Fatal error!\n' );
  fprintf ( 1, '  Illegal date!\n' );
  error ( 'YMDF_TO_JED_COMMON - Fatal error!' );

  return
end
