function [ c, w, s ] = jed_to_cws_gps ( jed )

%*****************************************************************************80
%
%% JED_TO_CWS_GPS converts a JED to a GPS CWS date.
%
%  Discussion:
%
%    The GPS time keeping is in terms of seconds, weeks, and cycles
%    of 1024 weeks.  The weeks and cycles begin numbering at 0.
%
%    The computation is only valid for dates after the GPS epoch,
%    that is, after 6 January 1980.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer C, W, real S, the 
%    corresponding GPS cycles/weeks/seconds date.
%
  jed_epoch = epoch_to_jed_gps ( );

  d = jed - jed_epoch;

  if ( d < 0.0 )
    s = -1.0;
    w = -1;
    c = -1;
    return
  end

  w = floor ( d / 7 );
  d = d - 7 * w;

  c = floor ( w / 1024 );
  w = w - 1024 * c;

  s = d * 24.0D+00 * 60.0D+00 * 60.0D+00;

  return
end
