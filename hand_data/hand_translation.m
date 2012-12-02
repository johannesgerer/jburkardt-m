function hand_translation ( )

%*****************************************************************************80
%
%% HAND_TRANSLATION applies a translation xy2 = xy + b to hand data.
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
%  Define the transformation as xy2 = xy + b.
%
  b = repmat ( [ 1.0; -0.5 ], 1, 60 );
%
%  Transform the data.
%
  xy2 = xy + b;
%
%  Clear the graphics frame.
%
  clf
%
%  Plot the original data.
%
  plot ( xy(1,:), xy(2,:), 'Color', 'r', 'LineWidth', 2 );
%
%  Plot the transformed data.
%
  hold on
  plot ( xy2(1,:), xy2(2,:), 'Color', 'b', 'LineWidth', 2 );
%
%  Annotate.
%
  axis equal
  grid on
  title ( 'Data (red), and data+[1.0;-0.5] (blue)' )

  hold off

  return
end
