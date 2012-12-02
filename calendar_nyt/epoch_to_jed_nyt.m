function jed = epoch_to_jed_nyt ( )

%*****************************************************************************80
%
%% EPOCH_TO_JED_NYT returns the epoch of the NYT calendar as a JED.
%
%  Discussion:
%
%    The "epoch" of the NYT calendar is the mythical date when issue "0"
%    would have been printed, namely, a tad past midnight, 17 September 1851.
%
%    Volume #1, Issue #1 was printed on 18 September 1851.
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
%    Output, real JED, the Julian Ephemeris Date of the epoch.
%
  jed = 2397382.5;

  return
end
