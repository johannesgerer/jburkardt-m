function jed2 = jed_to_nearest_noon ( jed1 )

%*****************************************************************************80
%
%% JED_TO_NEAREST_NOON converts a JED to the JED of the nearest noon.
%
%  Discussion:
%
%    This is primarily to make a fair test of the weekday routines,
%    which have trouble when the JED is at midnight.
%
%    Note that noon corresponds to an integral JED value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED1, the Julian Ephemeris Date.
%
%    Output, real JED2, the Julian Ephemeris Date
%    of the nearest noon.  If JED1 was at midnight, JED2 is
%    advanced to the NEXT noon, not the previous one.
%
  jed2 = round ( jed1 );

  return
end
