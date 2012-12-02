function jed = transition_to_jed_common ( )

%*****************************************************************************80
%
%% TRANSITION_TO_JED_COMMON returns the Common calendar transition as a JED.
%
%  Discussion:
%
%    In the Common calendar, the last moment of the Julian calendar was
%      11:59 pm, 4 October 1582 Julian/CE,
%      11:59 pm, 14 October 1582 Gregorian.
%    The first minute of the Gregorian calendar ended at
%      12:01 am, 5 October 1582 Julian,
%      12:01 am, 15 October 1582 Gregorian/CE.
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
%    Output, real JED, the Julian Ephemeris Date of the date.
%
  jed = 2299160.5;

  return
end
