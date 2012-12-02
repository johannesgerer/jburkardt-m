function jed = datenum_to_jed ( dn )

%*****************************************************************************80
%
%% DATENUM_TO_JED converts a MATLAB date number to a JED.
%
%  Discussion:
%
%    The MATLAB "datenum" function accepts a string defining
%    a date and returns a datenumber:
%
%      dn = datenum ( 'Aug 17 1939' )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real DN, a MATLAB date number.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  jed = dn + 1721058.5;

  return
end
