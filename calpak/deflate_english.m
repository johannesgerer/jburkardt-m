function [ y, m, d ] = deflate_english ( y, m, d )

%*****************************************************************************80
%
%% DEFLATE_ENGLISH "deflates" dates in the English Calendar transition month.
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
%    Input/output, integer Y, M, D, the YMD date.
%
  if ( y == 1752 )
    if ( m == 9 )
      if ( 14 <= d )
        d = d - 11;
      end
    end
  end

  return
end
