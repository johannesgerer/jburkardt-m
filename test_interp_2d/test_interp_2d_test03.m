function test_interp_2d_test03 ( )

%*****************************************************************************80
%
%% TEST_INTERP_2D_TEST03 plots each grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_2D_TEST03\n' );
  fprintf ( 1, '  Plot each grid.\n' );

  g_num = g00_num ( );
  filename = 'grid_00.png';

  for gi = 1 : g_num

    gt = g00_title ( gi );
    gn = g00_size ( gi );

    [ gx, gy ] = g00_xy ( gi, gn );

    plot ( gx, gy, 'b.', 'Markersize', 25 );
    title ( gt );
    grid on
    xlabel ( '<--- X --->' );
    ylabel ( '<--- Y --->' );
    axis ( 'equal' );

    filename = filename_inc ( filename );
    print ( '-dpng', filename );
    fprintf ( 1, '  Created file "%s".\n', filename );

  end

  return
end
