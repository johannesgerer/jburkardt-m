function hand_rotation ( )

%*****************************************************************************80
%
%% HAND_ROTATION rotates the hand data and plots the result.
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
%  Define the transformation as a rotation, 
%    A = [ cos(a), - sin(a); 
%          sin(a),   cos(a) ];
%
  alpha = 30.0 * pi / 180;
  sa = sin ( alpha );
  ca = cos ( alpha );

  A = [ ca, -sa; sa, ca ];
%
%  Apply the transformation.
%
  xy2 = A * xy;
  xy3 = A * xy2;
%
%  Clear the graphics frame.
%
  clf

  plot ( xy(1,:), xy(2,:), 'Color', 'r', 'LineWidth', 2 );
  hold on
%
%  Plot Axy and A^2xy.
%
  plot ( xy2(1,:), xy2(2,:), 'Color', 'b', 'LineWidth', 2 );
  plot ( xy3(1,:), xy3(2,:), 'Color', 'g', 'LineWidth', 2 );
%
%  Annotate.
%
  axis equal
  grid on
  title ( 'Data (red), and A*data (blue) and A*A*data(green)' )

  hold off

  return
end

