function line_num = sphere_cubed_line_num ( n )

%*****************************************************************************80
%
%% SPHERE_CUBED_LINE_NUM counts lines on a cubed sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sections into which each face of
%    the cube is to be divided.
%
%    Output, integer LINE_NUM, the number of lines.
%
  line_num = 0;
%
%  If N = 1, the corners form 12 lines.
%
  if ( n == 1 )
    line_num = 12;
    return
%
%  If 1 < N, each of 8 corners connects to three neighboring edges.
%
  else
    line_num = line_num + 8 * 3;
  end
%
%  If 2 < N, then each of the 12 edges includes lines.
%
  if ( 2 < n )
    line_num = line_num + 12 * ( n - 2 );
  end
%
%  Lines that belong to one of the six faces.
%
  if ( 1 < n )
    line_num = line_num + 6 * 2 * n * ( n - 1 );
  end

  return
end
