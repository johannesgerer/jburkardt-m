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
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, the YMD date.
%
  if ( y == 1582 )
    if ( m == 10 )
      if ( 15 <= d )
        d = d - 10
      end
    end
  end

  return
end
