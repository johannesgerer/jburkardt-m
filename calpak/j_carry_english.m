function [ y, j ] = j_carry_english ( y, j )

%*****************************************************************************80
%
%% J_CARRY_ENGLISH carries year-days to years in an English date.
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
%    Input/output, integer Y, J, a YJ date.
%
  while ( 1 )

    days = year_length_english ( y );

    if ( j < days )
      break
    end

    j = j - days;
    y = y + 1;

  end

  return
end
