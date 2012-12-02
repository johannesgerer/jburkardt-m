function hand_plot ( )

%*****************************************************************************80
%
%% HAND_PLOT plots the hand data.
%
%  Discussion:
%
%     This program assumes that the file 'HAND_NODES.TXT' is available.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625. 
%

%
%  Read the data.
%
  xy = load ( 'hand_nodes.txt' );
%
%  Make XY an array of column vectors.
%
  xy = xy';
%
%  Repeat the first column at the end so the polygon closes.
%
  xy = [ xy, [ xy(:,1) ] ];
%
%  Clear the graphics frame.
%
  clf

  plot ( xy(1,:), xy(2,:), 'Color', 'r', 'LineWidth', 2 );
  hold on;
  plot ( xy(1,:), xy(2,:), 'b.', 'MarkerSize', 15 );
  axis equal
  grid on
  title ( 'Hand data and straight line interpolant' )

  hold off

  return
end
