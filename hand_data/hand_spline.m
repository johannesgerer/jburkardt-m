function hand_spline ( )

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
%    14 April 2011
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

  [ m, n ] = size ( xy );
%
%  Consider the point index 1:N as the independent variable for X and Y.
%
  s = ( 1 : n )';
%
%  Prepare to evaluate the spline function at a grid 20 times finer.
%
  t = ( 1 : 0.05 : n )';
%
%  Compute splines U and V that treat X and Y as functions of the index.
%
  u = spline ( s, xy(1,:), t );
  v = spline ( s, xy(2,:), t );
%
%  Display the parameterized spline U(T), V(T):
%
  clf

  plot ( u, v, 'Color', 'r', 'LineWidth', 2 )
%
%  Include the data points.
%
  hold on
  plot ( xy(1,:), xy(2,:), 'b.', 'MarkerSize', 15 )
%
%  Annotate.
%
  axis equal
  grid on
  title ( 'Spline interpolant treating index as independent variable.' )

  hold off

  return
end
