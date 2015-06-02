function triangle_svg ( plot_filename, t, p_num, p )

%*****************************************************************************80
%
%% TRIANGLE_SVG plots a triangle and points in SVG format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PLOT_FILENAME, the name of the output file.
%
%    Input, real T(2,3), the vertices of the triangle.
%
%    Input, integer P_NUM, the number of points.
%
%    Input, real P(2,P_NUM), the nodes.
%

%
%  Determine SCALE, the maximum data range.
%
  t1 = max ( p(1,1:p_num) );
  t2 = max ( t(1,1:3) );
  x_max = max ( t1, t2 );
  t1 = min ( p(1,1:p_num) );
  t2 = min ( t(1,1:3) );
  x_min = min ( t1, t2 );
  x_scale = x_max - x_min;
  x_max = x_max + 0.05 * x_scale;
  x_min = x_min - 0.05 * x_scale;
  x_scale = x_max - x_min;

  t1 = max ( p(2,1:p_num) );
  t2 = max ( t(2,1:3) );
  y_max = max ( t1, t2 );
  t1 = min ( p(2,1:p_num) );
  t2 = min ( t(2,1:3) );
  y_min = min ( t1, t2 );
  y_scale = y_max - y_min;
  y_max = y_max + 0.05 * y_scale;
  y_min = y_min - 0.05 * y_scale;
  y_scale = y_max - y_min;

  i4_min = 1;
  j4_min = 1;
  if ( x_scale < y_scale )
    i4_max = round ( 0.5 + 500.0 * x_scale / y_scale );
    j4_max = 500;
  else
    i4_max = 500;
    j4_max = round ( 0.5 + 500.0 * y_scale / x_scale );
  end
%
%  Open the file.
%
  output = fopen ( plot_filename, 'wt' );

  if ( output < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_SVG - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'TRIANGLE_SVG - Fatal error!' );
  end
%
%  Write that junk.
%
  fprintf ( output, '<?xml version = "1.0" standalone="no"?>\n' );
  fprintf ( output, '\n' );
  fprintf ( output, '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"\n' );
  fprintf ( output, '  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n' );
  fprintf ( output, '\n' );
  fprintf ( output, '<svg \n' );
  fprintf ( output, '  width="%d" \n', i4_max );
  fprintf ( output, '  height="%d" \n', j4_max );
  fprintf ( output, '  viewbox="%d %d %d %d"\n', ...
    i4_min, j4_min, i4_max, j4_max );
  fprintf ( output, '  xmlns="http://www.w3.org/2000/svg" \n' );
  fprintf ( output, '  version="1.1">\n' );
  fprintf ( output, '  <desc> \n' );
  fprintf ( output, '    Triangulation created by triangle_svg.m\n' );
  fprintf ( output, '  </desc>\n' );
%
%  Draw the triangle.
%
  fprintf ( output, '  <polygon\n' );
  fprintf ( output, '    fill="pink"\n' );
  fprintf ( output, '    stroke="black"\n' );
  fprintf ( output, '    stroke-width="2"\n' );
  fprintf ( output, '    points="\n' );

  for j = 1 : 3
    i4 = r8_to_i4 ( x_min, x_max, t(1,j), i4_min, i4_max );
    j4 = r8_to_i4 ( y_max, y_min, t(2,j), j4_min, j4_max );
    fprintf ( output, '      %d,%d\n', i4, j4 );
  end

  fprintf ( output, '  "/>\n' );
%
%  Draw points.
%
  for j = 1 : p_num

    i4 = r8_to_i4 ( x_min, x_max, p(1,j), i4_min, i4_max );
    j4 = r8_to_i4 ( y_max, y_min, p(2,j), j4_min, j4_max );
    r = 5;
    fprintf ( output, '  <circle\n' );
    fprintf ( output, 'cx="%d"\n', i4 );
    fprintf ( output, 'cy="%d"\n', j4 );
    fprintf ( output, '    r="%d"\n', r );
    fprintf ( output, '    fill="blue"\n' );
    fprintf ( output, '    stroke="black"\n' );
    fprintf ( output, '    stroke-width="2"\n' );
    fprintf ( output, '  />\n' );

  end
%
%  End of plot.
%
  fprintf ( output, '</svg>\n' );

  fclose ( output );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics data written to file "%s"\n', plot_filename );

  return
end
