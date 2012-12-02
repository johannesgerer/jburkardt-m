function jed2 = jed_to_next_noon ( jed1 )

%*****************************************************************************80
%
%% JED_TO_NEXT_NOON converts a JED to the JED of the next noon.
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
%    of the next noon.
%
  jed2 = round ( jed1 );
%
%  The integer part of JED1 is one of the two integers that
%  bracket JED1.  If it's the smaller one (which it should
%  be as long as JED1 is positive), make it the bigger one.
%
%  This correctly leaves undisturbed cases where JED1 is
%  already an integer, and where JED1 is negative (which
%  is not a case we expect to occur often).
%
  if ( jed2 < jed1 )
    jed2 = jed2 + 1.0;
  end

  return
end
