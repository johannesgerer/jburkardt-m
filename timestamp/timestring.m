function s = timestring ( )

%*****************************************************************************80
%
%% TIMESTRING returns a string containing the current YMDHMS date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, string S, a string containing the current YMDHMS date.
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );

  return
end
