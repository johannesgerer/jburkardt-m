function [ c1, c2, c3, r1, r2, r3 ] = year_to_scaliger_common ( y )

%*****************************************************************************80
%
%% YEAR_TO_SCALIGER_COMMON converts a Common year to its Scaliger indices.
%
%  Discussion:
%
%    The year 4713 BCE was chosen by Joseph Scaliger for the start of
%    his Julian Ephemeris Date system, because three cycles coincided
%    in that year, the 28 year Julian calendar cycle, the 19 year Metonic
%    cycle, and the 15 year Roman Indiction cycle.  Thus, the year
%    4713 BCE has Scaliger index (1,1,1).  Each subsequent year has a distinct
%    set of Scaliger indices until 7980 years later, when the year
%    3266 CE will again have the Scaliger index (1,1,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the Common year.
%
%    Output, integer C1, C2, C3, the number of completed
%    Julian, Metonic and Indiction cycles.
%
%    Output, integer R1, R2, R3, the Julian, Metonic and
%    Indiction cycle numbers that make up the Scaliger index.
%
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_SCALIGER_COMMON - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_SCALIGER_COMMON - Fatal error!' );
  end
%
%  Adjust for missing year 0.
%
  if ( y < 0 )
    y2 = y + 1;
  else
    y2 = y;
  end
%
%  Now shift so 4713 BC becomes the year 1.
%
  y2 = y2 + 4713;

  c1 = floor ( ( y2 - 1 ) / 28 );
  c2 = floor ( ( y2 - 1 ) / 19 );
  c3 = floor ( ( y2 - 1 ) / 15 );

  r1 = i4_wrap ( y2, 1, 28 );
  r2 = i4_wrap ( y2, 1, 19 );
  r3 = i4_wrap ( y2, 1, 15 );

  return
end
