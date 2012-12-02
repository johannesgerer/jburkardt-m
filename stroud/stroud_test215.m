function stroud_test215 ( )

%*****************************************************************************80
%
%% TEST215 tests LENS_HALF_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  i_max = 8;
  r = 1.0;
  xc = 0.0;
  yc = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST215\n' );
  fprintf ( 1, '  LENS_HALF_2D approximates an integral within a\n' );
  fprintf ( 1, '    circular half lens, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integrate F(X,Y) = 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      R            Theta1      Theta2        Area        Order Integral\n' );
  fprintf ( 1, '\n' );

  for i = 0 : i_max

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / i_max;

    area = lens_half_area_2d ( r, theta1, theta2 );

    fprintf ( 1, '\n' );

    for norder = 2 : 2 : 16
      value = lens_half_2d ( 'f_1_2d', xc, yc, r, theta1, theta2, norder );
      fprintf ( 1, '  %12f  %12f  %12f  %12f  %4d  %12f\n', ...
        r, theta1, theta2, area, norder, value );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integrate F(X,Y) = X\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      R            Theta1      Theta2        Area        Order Integral\n' );
  fprintf ( 1, '\n' );

  for i = 0 : i_max

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / i_max;

    area = lens_half_area_2d ( r, theta1, theta2 );

    fprintf ( 1, '\n' );

    for norder = 2 : 2 : 16
      value = lens_half_2d ( 'f_x_2d', xc, yc, r, theta1, theta2, norder );
      fprintf ( 1, '  %12f  %12f  %12f  %12f  %4d  %12f\n', ...
        r, theta1, theta2, area, norder, value );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integrate F(X,Y) = R\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      R            Theta1      Theta2        Area        Order Integral\n' );
  fprintf ( 1, '\n' );

  for i = 0 : i_max

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / i_max;

    area = lens_half_area_2d ( r, theta1, theta2 );

    fprintf ( 1, '\n' );

    for norder = 2 : 2 : 16
      value = lens_half_2d ( 'f_r_2d', xc, yc, r, theta1, theta2, norder );
      fprintf ( 1, '  %12f  %12f  %12f  %12f  %4d  %12f\n', ...
        r, theta1, theta2, area, norder, value );
    end

  end

  return
end
