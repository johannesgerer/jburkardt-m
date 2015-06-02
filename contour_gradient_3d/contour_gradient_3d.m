function contour_gradient_3d ( )

  xmin = - 3.0;
  xmax = + 3.0;
  nx = 20;

  ymin = -3.0;
  ymax = +3.0;
  ny = 20;

  x = linspace ( xmin, xmax, nx );
  y = linspace ( ymin, ymax, ny );
  [ X, Y ] = meshgrid ( x, y );

  Z = 0.5 * ( 3 * X.^2 + 4 * X .* Y + 6 * Y.^2 ) - 2 * X + 8 * Y + 50;

  level_num = 20;
  contour ( X, Y, Z, level_num )
  hold on
  surf ( X, Y, Z )

  h = 0.01;
  [ U, V ] = gradient ( Z, h );
  quiver ( X, Y, U, V );

  view ( 3 );
  hold off

  xlabel ( '--X--' );
  ylabel ( '--Y--' );
  zlabel ( '--Z--' );
  title ( 'Contour + Gradient Vectors' )

  return
end

