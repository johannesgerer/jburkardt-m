function [ y, m, d, f ] = frac_carry_islamic ( y, m, d, f )

%*****************************************************************************80
%
%% FRAC_CARRY_ISLAMIC carries fractions from days in an Islamic YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, real F, a YMDF date.
%
  if ( f < 1.0 )
    return
  end

  days = floor ( f );

  f = f - days;
  d = d + days;

  [ y, m, d ] = day_carry_islamic ( y, m, d );

  return
end
