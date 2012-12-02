function p00_points_eps ( test, h, m, n, points, eps_file_name )

%*****************************************************************************80
%
%% P00_POINTS_EPS draws points in a region as an EPS file.
%
%  Discussion:
%
%    The boundary of the region is also drawn.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the number of the problem.
%
%    Input, real H, the maximum size of a segment of the boundary.
%    This controls how smoothly curved sections of the boundary will be drawn.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer POINTS(M,N), the points to draw.
%
%    Input, string EPS_FILE_NAME, the name of the EPS file
%    to create.
%
%  Local Parameters:
%
%    Local, integer CIRCLE_SIZE, controls the size of the circles
%    used to indicate points.  These are measured in PostScript points,
%    that is, 1/72 of an inch.  A value of 3, 4 or 5 is usually reasonable.
%
  circle_size = 4;
  show_points = 0;

  x_ps_max = 576;
  x_ps_max_clip = 594;
  x_ps_min = 36;
  x_ps_min_clip = 18;
  y_ps_max = 666;
  y_ps_max_clip = 684;
  y_ps_min = 126;
  y_ps_min_clip = 108;
%
%  Determine the range of the points.
%
  [ lo, hi ] = p00_box ( test, m );

  x_min = lo(1) - 0.025 * ( hi(1) - lo(1) );
  y_min = lo(2) - 0.025 * ( hi(2) - lo(2) );
  x_max = hi(1) + 0.025 * ( hi(1) - lo(1) );
  y_max = hi(2) + 0.025 * ( hi(2) - lo(2) );

  x_min = min ( x_min, min ( points(1,1:n) ) );
  x_max = max ( x_max, max ( points(1,1:n) ) );
  y_min = min ( y_min, min ( points(2,1:n) ) );
  y_max = max ( y_max, max ( points(2,1:n) ) );

  x_scale = x_max - x_min;
  y_scale = y_max - y_min;
  scale = max ( x_scale, y_scale );
%
%  Determine the PostScript coordinates of the used box.
%
  x_ps_min_user = round ( ( x_ps_max + x_ps_min ...
    - ( x_ps_max - x_ps_min ) * x_scale / scale ) / 2 );
  x_ps_max_user = round ( ( x_ps_max + x_ps_min ...
    + ( x_ps_max - x_ps_min ) * x_scale / scale ) / 2 );
  y_ps_min_user = round ( ( y_ps_max + y_ps_min ...
    - ( y_ps_max - y_ps_min ) * y_scale / scale ) / 2 );
  y_ps_max_user = round ( ( y_ps_max + y_ps_min ...
    + ( y_ps_max - y_ps_min ) * y_scale / scale ) / 2 );

  if ( x_scale < y_scale )
    x_max = x_max + 0.5 * ( y_scale - x_scale );
    x_min = x_min - 0.5 * ( y_scale - x_scale );
  elseif ( y_scale < x_scale )
    y_max = y_max + 0.5 * ( x_scale - y_scale );
    y_min = y_min - 0.5 * ( x_scale - y_scale );
  end

  segment_num = p00_boundary_segment_num ( test );

  eps_unit = fopen ( eps_file_name, 'w' );

  if ( eps_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_POINTS_EPS - Fatal error!\n' );
    fprintf ( 1, '  Could not open output file "%s".\n', eps_file_name );
    error ( 'P00_POINTS_EPS - Fatal error!' );
  end

  fprintf ( eps_unit, '%!PS-Adobe-3.0 EPSF-3.0\n' );
  fprintf ( eps_unit, '%%Creator: p00_points_eps.m\n' );
  fprintf ( eps_unit, '%%Title: %s\n', eps_file_name );
  fprintf ( eps_unit, '%%Pages: 1\n' );
  fprintf ( eps_unit, '%%BoundingBox:  %d  %d  %d  %d\n', ...
    x_ps_min_user, y_ps_min_user, x_ps_max_user, y_ps_max_user );
  fprintf ( eps_unit, '%%Document-Fonts: Times-Roman\n' );
  fprintf ( eps_unit, '%%LanguageLevel: 1\n' );
  fprintf ( eps_unit, '%%EndComments\n' );
  fprintf ( eps_unit, '%%BeginProlog\n' );
  fprintf ( eps_unit, '/inch {72 mul} def\n' );
  fprintf ( eps_unit, '%%EndProlog\n' );
  fprintf ( eps_unit, '%%Page:      1     1\n' );
  fprintf ( eps_unit, 'save\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Set RGB line color.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.9000 0.9000 0.9000 setrgbcolor\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Draw a gray border around the page.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, 'newpath\n' );
  fprintf ( eps_unit, '  %d  %d moveto\n', x_ps_min_user, y_ps_min_user );
  fprintf ( eps_unit, '  %d  %d lineto\n', x_ps_max_user, y_ps_min_user );
  fprintf ( eps_unit, '  %d  %d lineto\n', x_ps_max_user, y_ps_max_user );
  fprintf ( eps_unit, '  %d  %d lineto\n', x_ps_min_user, y_ps_max_user );
  fprintf ( eps_unit, '  %d  %d lineto\n', x_ps_min_user, y_ps_min_user );
  fprintf ( eps_unit, 'stroke\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Set RGB line color to black.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.0000 0.0000 0.0000 setrgbcolor\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Set the font and its size:\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '/Times-Roman findfont\n' );
  fprintf ( eps_unit, '0.50 inch scalefont\n' );
  fprintf ( eps_unit, 'setfont\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% Define a clipping polygon\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '  %d  %d  moveto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( eps_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_min_clip );
  fprintf ( eps_unit, '  %d  %d  lineto\n', x_ps_max_clip, y_ps_max_clip );
  fprintf ( eps_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_max_clip );
  fprintf ( eps_unit, '  %d  %d  lineto\n', x_ps_min_clip, y_ps_min_clip );
  fprintf ( eps_unit, 'clip newpath\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Draw the boundary in red:\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, ' 0.900 0.200 0.100 setrgbcolor\n' );
  fprintf ( eps_unit, 'newpath\n' );

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Increase the linewidth to 3.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '  3  setlinewidth%\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Draw the boundary lines.\n' );
  fprintf ( eps_unit, '%\n' );

  for segment = 1 : segment_num

    segment_length = p00_boundary_segment_length ( test, segment, h );

    if ( segment_length <= 0 )
      continue
    end

    boundary = p00_boundary_segment ( test, segment, m, segment_length );

    for j = 1 : segment_length

      x_ps = round ( ...
        ( ( x_max - boundary(1,j)         ) * x_ps_min   ...
        + (         boundary(1,j) - x_min ) * x_ps_max ) ...
        / ( x_max                 - x_min ) );

      y_ps = round ( ...
        ( ( y_max - boundary(2,j)         ) * y_ps_min   ...
        + (         boundary(2,j) - y_min ) * y_ps_max ) ...
        / ( y_max                 - y_min ) );

      if ( j == 1 )
        fprintf ( eps_unit, '  %d  %d  moveto\n', x_ps, y_ps );
      else
        fprintf ( eps_unit, '  %d  %d  lineto\n', x_ps, y_ps );
      end

    end

    fprintf ( eps_unit, 'stroke\n' );

  end

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Set the RGB line color to blue.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '0.000  0.150  0.750 setrgbcolor\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Restore the linewidth to 1.\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '1  setlinewidth\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%  Draw the nodes.\n' );
  fprintf ( eps_unit, '%\n' );

  for j = 1 : n

    eps_x = round ( ( ( x_max - points(1,j)         ) * x_ps_min   ...
                    + (       + points(1,j) - x_min ) * x_ps_max ) ...
                    / scale );

    eps_y = round ( ( ( y_max - points(2,j)         ) * y_ps_min   ...
                    + (         points(2,j) - y_min ) * y_ps_max ) ...
                    / scale );

    fprintf ( eps_unit, 'newpath  %d  %d  %d  0 360 arc closepath fill\n', ...
      eps_x, eps_y, circle_size );

  end

  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, 'restore showpage\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '% End of page\n' );
  fprintf ( eps_unit, '%\n' );
  fprintf ( eps_unit, '%%Trailer\n' );
  fprintf ( eps_unit, '%%EOF\n' );

  fclose ( eps_unit );

  return
end
