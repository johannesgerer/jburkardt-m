function s = ymdf_to_s_common ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_COMMON writes a Common YMDF date into a string.
%
%  Format:
%
%    CE YYYY/MM/DD.FF
%    BCE YYYY/MM/DD.FF
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
%    Input, integer Y, integer M, integer D, real F, the YMDF date.
%
%    Output, string S, a representation of the date.
%

%
%  Copy the input.
%
  y2 = y;
  m2 = m;
  d2 = d;
  f2 = f;
%
%  Check the input.
%
  [ y2, m2, d2, f2, ierror ] = ymdf_check_common ( y2, m2, d2, f2 );

  if ( ierror ~= 0 )
    s = sprintf ( '?' );
    return
  end

  if ( 0 <= y2 )
    s = sprintf ( 'CE %d/%d/%d/%f', y2, m2, d2, f2 );
  else
    s = sprintf ( 'BCE %d/%d/%d/%f', -y2, m2, d2, f2 );
  end

  return
end
