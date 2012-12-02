function dn = jed_to_datenum ( jed )

%*****************************************************************************80
%
%% JED_TO_DATENUM converts a JED to a MATLAB date number.
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
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, real DN, a MATLAB date number.
%
  dn = jed - 1721058.5;

  return
end
