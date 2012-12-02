function [ y, m, d ] = deflate_common ( y, m, d )

%*****************************************************************************80
%
%% DEFLATE_COMMON "deflates" dates in the Common Calendar transition month.
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
%    Input, integer Y, integer M, integer D, the YMD date.
%
%    Output, integer Y, integer M, integer D, the YMD date.
%

  if ( y == 1582 )
    if ( m == 10 )
      if ( 15 <= d )
        d = d - 10;
      end
    end
  end

  return
end
