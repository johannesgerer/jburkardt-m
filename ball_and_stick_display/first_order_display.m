function first_order_display ( )

%*****************************************************************************80
%
%% FIRST_ORDER_DISPLAY plots a first order method sequentially.
%
%  Discussion:
%
%    A sequence of ball and stick images is shown, one at a time.
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

  for frame = 0 : 7
%
%  Clear the plotting frame.
%
    clf
%
%  Make all the subsequent plotting "cumulative".
%
    hold on
%
%  Nodes on the blue level.
%
    if ( 1 <= frame )
      plot3 (  0.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end

    if ( 2 <= frame )
      plot3 (  [ -0.5,  0.5 ],  [ -0.5, -0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [ -0.5,  0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.5, -0.5 ],  [  0.5,  0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [ -0.5, -0.5 ],  [  0.5, -0.5 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
    end

    if ( 3 <= frame )
      plot3 ( -1.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  1.0,  0.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -1.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0,  1.0, 0.0, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end

    if ( 4 <= frame )
      plot3 (  [  1.0,  0.0 ],  [  0.0,  0.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [ -1.0,  0.0 ],  [  0.0,  0.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [  1.0,  0.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -1.0,  0.0 ],  [ 0.0, 0.0 ], 'b', 'LineWidth', 3 )
    end

    if ( 5 <= frame )
      plot3 (  [  0.0,  0.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  0.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end

    if ( 6 <= frame )
      plot3 (  [ -0.5,  0.5 ],  [ -0.5, -0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [  0.5,  0.5 ],  [ -0.5,  0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [  0.5, -0.5 ],  [  0.5,  0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
      plot3 (  [ -0.5, -0.5 ],  [  0.5, -0.5 ],  [ 1.0, 1.0 ], 'r', 'LineWidth', 3 )
    end

    if ( 7 <= frame )
      plot3 (  [ -1.0, -1.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [ +1.0, +1.0 ],  [  0.0,  0.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ -1.0, -1.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 (  [  0.0,  0.0 ],  [ +1.0, +1.0 ],  [ 0.0, 1.0 ], 'k', 'LineWidth', 3 )
      plot3 ( -1.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 ( +1.0,  0.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, -1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
      plot3 (  0.0, +1.0, 1.0, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'MarkerSize', 12 )
    end
%
%  Labels.
%
    if ( frame == 0 )
      title ( 'First order in time stencil' )
    elseif ( frame == 1 )
      title ( 'A node where we have the solution.' )
    elseif ( frame == 2 )
      title ( 'The region associated with the node.' )
    elseif ( frame == 3 )
      title ( 'The node and its four neighbors.' )
    elseif ( frame == 4 )
      title ( 'Fluxes are differences across the neighbors.' )
    elseif ( frame == 5 )
      title ( 'A full time step is now taken.' )
    elseif ( frame == 6 )
      title ( 'We have an estimate for the solution in this region.' )
    elseif ( frame == 7 )
      title ( 'All the nodes can be advanced in this way.' )
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
