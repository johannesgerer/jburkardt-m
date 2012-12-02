function [ y, m, d, f ] = frac_carry_julian ( y, m, d, f )

%*****************************************************************************80
%
%% FRAC_CARRY_JULIAN carries fractions from days in a Julian YMDF date.
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
%    Input, integer Y, integer M, integer D, real F,
%    a YMDF date.
%
%    Output, integer Y, integer M, integer D, real F,
%    a YMDF date.
%
  if ( f < 1.0 )
    return
  end

  days = floor ( f );

  f = f - days;
  d = d + days;

  [ y, m, d ] = day_carry_julian ( y, m, d );

  return
end
