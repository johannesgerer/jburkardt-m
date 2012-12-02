function lax_wendroff_2d_display ( )

%*****************************************************************************80
%
%% LAX_WENDROFF_2D_DISPLAY illustrates the Lax-Wendroff procedure in 2D.
%
%  Discussion:
%
%    A sequence of ball and stick drawings is displayed in steps 0 through 9.
%
%    Hitting return causes the next item to be drawn.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2003
%
%  Author:
%
%    John Burkardt
%
  for frame = 0 : 9
%
%  Clear the plotting frame.
%
    clf
%
%  Make all the subsequent plotting "cumulative".
%
    hold on

    if ( 0 == frame )
      title ( 'Lax-Wendroff 2D scheme' )
    end
%
%  Central nodes on the blue level.
%
    if ( 1 <= frame )
      plot3 (  0.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
    if ( frame == 1 )
      title ( 'A node where we have the solution.' )
    end
%
%  The region associated with the central node, blue level.
%
    if ( 2 <= frame )
      plot3 (  [ -0.5,  0.5 ],  [ -0.5, -0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [ -0.5,  0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.5, -0.5 ],  [  0.5,  0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [ -0.5, -0.5 ],  [  0.5, -0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
    end
    if ( frame == 2 )
      title ( 'The region associated with the node.' )
    end
%
%  Neighbor nodes on the blue level.
%
    if ( 3 <= frame )
      plot3 ( -1.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  1.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -1.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0,  1.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
    if ( frame == 3 )
      title ( 'The neighboring nodes.' )
    end
%
%  Midside nodes on the blue level.
%
    if ( 4 <= frame )
      plot3 ( -0.5,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.5,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -0.5, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0,  0.5, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
    if ( frame == 4 )
      plot3 (  [ -1.0, +1.0 ],  [  0.0,  0.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -1.0,  1.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
    end
    if ( frame == 4 )
      title ( 'Values at midsides by averaging.' )
    end
%
%  Center node on the green level.
%  Line from center node on blue to center node on green.
%
    if ( 5 <= frame )
      plot3 ( -0.5,  0.0, 0.5, 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.5,  0.0, 0.5, 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -0.5, 0.5, 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0,  0.5, 0.5, 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  [ -0.5,  0.5 ],  [ -0.5, -0.5 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [ -0.5,  0.5 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [  0.5, -0.5 ],  [  0.5,  0.5 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [ -0.5, -0.5 ],  [  0.5, -0.5 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
    end
    if ( frame == 5 )
      plot3 (  [ -0.5, -0.5 ],  [  0.0,  0.0 ],  [ 0.0, 0.5 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [  0.0,  0.0 ],  [ 0.0, 0.5 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -0.5, -0.5 ],  [ 0.0, 0.5 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [  0.5,  0.5 ],  [ 0.0, 0.5 ], 'k', 'LineWidth', 3 )
    end
    if ( frame == 5 )
      title ( 'Values at midside, half time step.' )
    end
%
%  Lines from midside nodes to center.
%
    if ( 6 == frame )
      plot3 (  [  0.5,  0.0 ],  [  0.0,  0.0 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [ -0.5,  0.0 ],  [  0.0,  0.0 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [  0.5,  0.0 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -0.5,  0.0 ],  [ 0.5, 0.5 ], 'g', 'LineWidth', 3 )
    end
    if ( frame == 6 )
      title ( 'Estimate fluxes' )
    end
%
%  Carry neighbor nodes to green level, and draw lines.
%
    if ( 7 <= frame )
      plot3 (  0.0,  0.0, 0.5, 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
    if ( frame == 7 )
      title ( 'Estimate derivative at node, half time step.' )
    end
%
%  Advance solution to full time.
%
    if ( 8 <= frame )
      plot3 (  [  0.0,  0.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  0.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  [ -0.5,  0.5 ],  [ -0.5, -0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [ -0.5,  0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [  0.5, -0.5 ],  [  0.5,  0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [ -0.5, -0.5 ],  [  0.5, -0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
    end
    if ( frame == 8 )
      title ( 'Take full step to new time.' )
    end
%
%  Advance all data.
%
    if ( 9 <= frame )
      plot3 (  [ -1.0, -1.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [  1.0,  1.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -1.0, -1.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [  1.0,  1.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 ( -1.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  1.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0,  1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
    if ( frame == 9 )
      title ( 'Advance all data to new time.' )
    end

    xlabel ( '- X -' )
    ylabel ( '- Y -' )
    zlabel ( '- Time -' )

    axis ( [ -1, +1, -1, +1, 0, 1] )
    view ( 3 )
%
%  "Release" the plotting screen.
%
    hold off

    pause

  end

  return
end
