function [ y, m, d, f ] = jed_to_ymdf_english ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_ENGLISH converts a JED to an English YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2012
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
  jed_transition = transition_to_jed_english ( );

  if ( jed <= jed_transition )
    [ y, m, d, f ] = jed_to_ymdf_julian ( jed );
  else
    [ y, m, d, f ] = jed_to_ymdf_gregorian ( jed );
  end

  return
end