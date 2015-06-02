function jed = transition_to_jed_english ( )

%*****************************************************************************80
%
%% TRANSITION_TO_JED_ENGLISH returns the English calendar transition as a JED.
%
%  Discussion:
%
%    In the English calendar, the last moment of the Julian calendar was
%      11:59 pm, 2 September 1752 Julian/English,
%      11:59 pm, 13 September 1752 Gregorian/CE.
%    The first minute of the Gregorian calendar ended at
%      12:01 am, 3 September 1752 Julian,
%      12:01 am, 15 September 1752 Gregorian/CE/English.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real JED, the Julian Ephemeris Date of the date.
%
  jed = 2361221.5;

  return
end
