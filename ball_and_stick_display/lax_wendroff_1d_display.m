function lax_wendroff_1d_display ( )

%*****************************************************************************80
%
%% LAX_WENDROFF_1D_DISPLAY illustrates the Lax-Wendroff procedure in 1D.
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
%    01 July 2012
%
%  Author:
%
%    John Burkardt
%
  for frame = 0 : 10
%
%  Clear the plotting frame.
%
    clf
%
%  Make all the subsequent plotting "cumulative".
%
    hold on

    if ( 0 == frame )

      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 0.0, 0.0, 0.0, 0.0, 0.0 ], ...
        'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 1.0, 1.0, 1.0, 1.0, 1.0 ], ...
        'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 2.0, 2.0, 2.0, 2.0, 2.0 ], ...
        'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Lax-Wendroff 1D scheme', 'Fontsize', 24 )
    elseif ( 0 <= frame && frame < 10 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 0.0, 0.0, 0.0, 0.0, 0.0 ], ...
        'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 1.0, 1.0, 1.0, 1.0, 1.0 ], ...
        'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 2.0, 2.0, 2.0, 2.0, 2.0 ], ...
        'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  1: A node where we have the solution.
%
    if ( 1 == frame )
      plot (  0.0,  0.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'A node where we have the solution.', 'Fontsize', 24 )
    elseif ( 1 < frame && frame < 10 )
      plot (  0.0,  0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  The region associated with the central node.
%
    if ( 2 == frame )
      plot (  [ -0.5, -0.5 ],  [ -0.2, +0.2 ], 'r', 'LineWidth', 4 )
      plot (  [ +0.5, +0.5 ],  [ -0.2, +0.2 ], 'r', 'LineWidth', 4 )
      title ( 'The region associated with the node.', 'Fontsize', 24 )
    elseif ( 2 < frame && frame < 10 )
      plot (  [ -0.5, -0.5 ],  [ -0.2, +0.2 ], 'b', 'LineWidth', 3 )
      plot (  [ +0.5, +0.5 ],  [ -0.2, +0.2 ], 'b', 'LineWidth', 3 )
    end
%
%  Neighbor nodes.
%
    if ( 3 == frame )
      plot (  -1.0,  0.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  +1.0,  0.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'The neighboring nodes.', 'Fontsize', 24 )
    elseif ( 3 < frame && frame < 10 )
      plot (  -1.0,  0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  +1.0,  0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Halfway nodes at this time level.
%
    if ( 4 == frame )
      plot (  [ -1.0,  0.0 ],  [  0.0,  0.0 ], 'r', 'LineWidth', 4 )
      plot (  [  1.0, +0.0 ],  [  0.0,  0.0 ], 'r', 'LineWidth', 4 )
      plot (  -0.5,  0.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  +0.5,  0.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Values at midsides by averaging.', 'Fontsize', 24 )
    elseif ( 4 < frame && frame < 10 )
      plot (  [ -1.0,  0.0 ],  [  0.0,  0.0 ], 'b', 'LineWidth', 3 )
      plot (  [  1.0, +0.0 ],  [  0.0,  0.0 ], 'b', 'LineWidth', 3 )
      plot (  -0.5,  0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  +0.5,  0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Extend to halfway nodes at halfway time
%
    if ( 5 == frame )
      plot (  [ -0.5,  -0.5 ],  [ 0.0, 0.5 ], 'r', 'LineWidth', 4 )
      plot (  [  0.5,   0.5 ],  [ 0.0, 0.5 ], 'r', 'LineWidth', 4 )
      plot (  -0.5,  0.5, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  +0.5,  0.5, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Values at midside, half time step.', 'Fontsize', 24 )
    elseif ( 5 < frame && frame < 10 )
      plot (  [ -0.5,  -0.5 ],  [ 0.0, 0.5 ], 'b', 'LineWidth', 3 )
      plot (  [  0.5,   0.5 ],  [ 0.0, 0.5 ], 'b', 'LineWidth', 3 )
      plot (  -0.5,  0.5, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  +0.5,  0.5, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Lines from midside nodes to center.
%
    if ( 6 == frame )
      plot (  [ -0.5, +0.5 ],  [  0.5,  0.5 ], 'r', 'LineWidth', 4 )
      plot (  [ -0.5, -0.5 ],  [ 0.3, 0.7 ], 'r', 'LineWidth', 4 )
      plot (  [  0.5,  0.5 ],  [ 0.3, 0.7 ], 'r', 'LineWidth', 4 )
      title ( 'Estimate fluxes', 'Fontsize', 24 )
    elseif ( 6 < frame && frame < 10 )
      plot (  [ -0.5, +0.5 ],  [  0.5,  0.5 ], 'b', 'LineWidth', 3 )
      plot (  [ -0.5, -0.5 ],  [ 0.3, 0.7 ], 'b', 'LineWidth', 3 )
      plot (  [  0.5,  0.5 ],  [ 0.3, 0.7 ], 'b', 'LineWidth', 3 )
    end
%
%  Carry neighbor nodes to green level, and draw lines.
%
    if ( frame == 7 )
      plot (  0.0, 0.5, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Estimate derivative at node, half time step.', 'Fontsize', 24 )
    elseif ( 7 < frame && frame < 10 )
      plot (  0.0, 0.5, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Advance solution to full time.
%
    if ( 8 == frame )
      plot (  [  0.0,  0.0 ], [ 0.0, 1.0 ], 'r', 'LineWidth', 4 )
      plot (  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Take full step to new time.', 'Fontsize', 24 )
    elseif ( 8 < frame && frame < 10 )
      plot (  [  0.0,  0.0 ], [ 0.0, 1.0 ], 'b', 'LineWidth', 3 )
      plot (  0.0, 1.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Advance all data.
%
    if ( 9 == frame )
      plot (  [  -2.0,  -2.0 ], [ 0.0, 1.0 ], 'r', 'LineWidth', 4 )
      plot (  [  -1.0,  -1.0 ], [ 0.0, 1.0 ], 'r', 'LineWidth', 4 )
      plot (  [   1.0,   1.0 ], [ 0.0, 1.0 ], 'r', 'LineWidth', 4 )
      plot (  [   2.0,   2.0 ], [ 0.0, 1.0 ], 'r', 'LineWidth', 4 )
      plot (  -2.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (  -1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (   1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      plot (   2.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Advance all data to new time.', 'Fontsize', 24 )
    end
%
%  Ready for next step.
%
    if ( 10 == frame )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 2.0, 2.0, 2.0, 2.0, 2.0 ], ...
        'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 1.0, 1.0, 1.0, 1.0, 1.0 ], ...
        'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  [-2.0, -1.0,  0.0, 1.0, 2.0], [ 0.0, 0.0, 0.0, 0.0, 0.0 ], ...
        'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot (  0.0,  1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 18 )
      title ( 'Ready to compute next time step', 'Fontsize', 24 )
    end

    grid on
    xlabel ( '<--- X --->' )
    ylabel ( '<-- Time --->' )

    axis ( [ -2.25, +2.25, -0.5, 2.5 ] )

    filename = sprintf ( 'lw1d%02d.png', frame );
    fprintf ( 1, '  Saving image as "%s"\n', filename );
    print ( '-dpng', filename )
%
%  "Release" the plotting screen.
%
    hold off

    pause

  end

  return
end
