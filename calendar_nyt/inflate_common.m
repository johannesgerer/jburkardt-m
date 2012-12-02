function [ y, m, d ] = inflate_common ( y, m, d )

%*****************************************************************************80
%
%% INFLATE_COMMON "inflates" dates in the Common Calendar transition month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2001
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
      if ( 5 <= d )
        d = d + 10;
      end
    end
  end

  return
end
