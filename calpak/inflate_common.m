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
      if ( 5 <= d )
        d = d + 10;
      end
    end
  end

  return
end
