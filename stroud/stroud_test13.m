function stroud_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests CIRCLE_SECTOR, CIRCLE_SECTOR_AREA_2D.
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
  global FUNC_2D_INDEX;

  nrlo = 1;
  nrhi = 5;
  ntest = 4;

  radius_test = [ 1.0, 2.0, 4.0, 8.0 ];
  theta1_test = [ 0.0, 0.0, 0.0, 0.0 ];
  theta2_test = [ 2.0, 1.0, 0.5, 0.25 ];
  xc_test = [ 0.0, 0.0, 0.0, 0.0 ];
  yc_test = [ 0.0, 0.0, 0.0, 0.0 ];

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  CIRCLE_SECTOR_AREA_2D computes the area\n' );
  fprintf ( 1, '    of a circular sector.\n' );
  fprintf ( 1, '  CIRCLE_SECTOR estimates an integral \n' );
  fprintf ( 1, '    in a circular sector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user can specify NR, the number of radial values\n' );
  fprintf ( 1, '  used to approximated the integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, computations will use values of NR\n' );
  fprintf ( 1, '  from %d  to  %d\n', nrlo, nrhi );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    xc = xc_test(i);
    yc = yc_test(i);
    radius = radius_test(i);
    theta1 = theta1_test(i) * pi;
    theta2 = theta2_test(i) * pi;

    area = circle_sector_area_2d ( radius, theta1, theta2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    XC        YC      RADIUS  THETA1  THETA2  Area\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %6f  %6f  %6f  %6f  %6f  %6f\n', ...
      xc, yc, radius, theta1, theta2, area );
    fprintf ( 1, '\n' );
    fprintf ( 1, '      F' );
    for nr = nrlo : nrhi
      fprintf ( 1, '      %2d      ', nr );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for j = 1 : num

      FUNC_2D_INDEX = j;

      for nr = nrlo : nrhi
        result(nr) = circle_sector ( 'function_2d', xc, yc, radius, theta1, theta2, nr );
      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s  ', fname )
      for nr = nrlo : nrhi
        fprintf ( 1, '  %12f', result(nr) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
