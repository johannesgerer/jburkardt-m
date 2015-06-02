function [ y, m, d, h, n, s ] = second_borrow_common ( y, m, d, h, n, s )

%*****************************************************************************80
%
%% SECOND_BORROW_COMMON "borrows" a minute of seconds in a common date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, N, S, the YMDHMS date.
%
  while ( s < 0 )

    s = s + 60;
    n = n - 1;

    [ y, m, d, h, n ] = minute_borrow_common ( y, m, d, h, n );

  end

  return
end
