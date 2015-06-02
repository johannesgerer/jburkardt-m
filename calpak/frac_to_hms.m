function [ h, m, s ] = frac_to_hms ( f )

%*****************************************************************************80
%
%% FRAC_TO_HMS converts a fractional day into hours, minutes, seconds.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real F, a day fraction between 0.0 and 1.0.
%
%    Output, integer H, M, S, the equivalent hours, minutes
%    and seconds.
%
  f2 = f;

  f2 = 24.0 * f2;
  h = floor ( f2 );
  f2 = f2 - h;

  f2 = 60.0 * f2;
  m = floor ( f2 );
  f2 = f2 - m;

  f2 = 60.0 * f2;
  s = floor ( f2 );
  f2 = f2 - s;

  return
end
