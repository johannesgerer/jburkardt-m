function jed = nyt_to_jed ( volume, issue )

%*****************************************************************************80
%
%% NYT_TO_JED converts an NYT date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer VOLUME, ISSUE, the New York Times
%    volume and issue.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  jed_epoch_50000 = 2449790.5;

  if ( 149 < volume )

    jed = jed_epoch_50000 + issue - 50000 + 500;
%
%  Take care of the bizarre case of the second half of Volume 149,
%  Jan 1 2000 to Sep 17 2000, issues 51254 through ?, which were also
%  lowered by 500.
%
  elseif ( volume == 149 & issue < 51600 )

    jed = jed_epoch_50000 + issue - 50000 + 500;

  elseif ( 44028 <= issue )

    jed = jed_epoch_50000 + issue - 50000;
%
%  Factor in the strike of 1978.
%
  else

    jed = jed_epoch_50000 + issue - 50000 - 88;

  end

  return
end
