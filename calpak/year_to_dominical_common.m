function [ n1, n2 ] = year_to_dominical_common ( y )

%*****************************************************************************80
%
%% YEAR_TO_DOMINICAL_COMMON: dominical numbers, Common calendar.
%
%  Discussion:
%
%    The Julian calendar calculations are used through the year 1582,
%    and the Gregorian thereafter.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer N1, N2, the dominical numbers for the year.
%    If Y is a leap year, then N1 applies before March 1, and N2 after.
%    If Y is not a leap year, then N1 applies throughout the year,
%    and N2 is returned as N1.
%
  if ( y <= 1582 )
    [ n1, n2 ] = year_to_dominical_julian ( y );
  else
    [ n1, n2 ] = year_to_dominical_gregorian ( y );
  end

  return
end

