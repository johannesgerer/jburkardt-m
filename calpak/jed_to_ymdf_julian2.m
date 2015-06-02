function [ y, m, d, f ] = jed_to_ymdf_julian2 ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_JULIAN2 converts a JED to a Julian YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%

%
%  Check the input.
%
  ierror = jed_check ( jed );

  if ( ierror ~= 0 )
    y = -1;
    m = -1;
    d = -1;
    f = -1.0;
    return
  end

  j = floor ( jed + 0.5 );
  f = ( jed + 0.5 ) - j;

  jd = floor ( ( j + 1524 - 122.1 ) / 365.25 );
  je = floor ( 365.25 * jd );
  jg = floor ( ( j + 1524 - je ) / 30.6001 );
%
%  Now compute D, M and Y.
%
  d = j + 1524 - je - floor ( 30.6001 * jg );

  if ( jg <= 13 )
    m = jg - 1;
  else
    m = jg - 13;
  end

  if ( 2 < m )
    y = jd - 4716;
  else
    y = jd - 4715;
  end
%
%  Any year before 1 AD must be moved one year further back, since
%  this calendar does not include a year 0.
%
  y = y_astronomical_to_common ( y );

  return
end
