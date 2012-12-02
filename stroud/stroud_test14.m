function stroud_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests CIRCLE_SECTOR, CIRCLE_RT_SET, CIRCLE_RT_SUM.
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

  ntest = 4;

  radius_test = [ 1.0, 2.0, 4.0, 8.0 ];
  theta1_test = [ 0.0, 0.0, 0.0, 0.0 ];
  theta2_test = [ 2.0, 1.0, 0.5, 0.25 ];
  xc_test = [ 0.0, 0.0, 0.0, 0.0 ];
  yc_test = [ 0.0, 0.0, 0.0, 0.0 ];

  num = function_2d_num ( );
  nr = 5;
  rule = 9;
  [ nr2, nt, nc ] = circle_rt_size ( rule );
  [ ra, rw, ta, tw, zw ] = circle_rt_set ( rule, nr2, nt, nc );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  CIRCLE_SECTOR estimates integrals in a circular sector.\n' );
  fprintf ( 1, '  CIRCLE_RT_SET sets an integration rule in a circle.\n' );
  fprintf ( 1, '  CIRCLE_RT_SUM uses an integration rule in a circle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To test CIRCLE_SECTOR, we estimate an integral over\n' );
  fprintf ( 1, '  a sector, and over its complement and add the results\n' );
  fprintf ( 1, '  to get RESULT1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We also estimate the integral over the whole circle\n' );
  fprintf ( 1, '  using CIRCLE_RT_SET and CIRCLE_RT_SUM to get RESULT2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will then compare RESULT1 and RESULT2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CIRCLE_SECTOR computations will use NR = %d\n',nr );
  fprintf ( 1, '  CIRCLE_RT_SET/CIRCLE_RT_SUM will use rule %d\n', rule );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Sector1" and "Sector2" are the CIRCLE_SECTOR\n' );
  fprintf ( 1, '  computations\n' );
  fprintf ( 1, '  for the sector and its complement.\n' );
  fprintf ( 1, '  "Sum" is the sum of Sector1 and Sector2.\n' );
  fprintf ( 1, '  "Circle" is the computation for\n' );
  fprintf ( 1, '  CIRCLE_RT_SET + CIRCLE_RT_SUM.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    xc = xc_test(i);
    yc = yc_test(i);
    radius = radius_test(i);

    theta1 = theta1_test(i) * pi;
    theta2 = theta2_test(i) * pi;
    theta3 = theta2 + 2.0 * pi - ( theta2 - theta1 );

    area1 = circle_sector_area_2d ( radius, theta1, theta2 );
    area2 = circle_sector_area_2d ( radius, theta2, theta3 );
    area3 = circle_area_2d ( radius );

    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '   XC       YC       RADIUS   THETA1   THETA2   Area1   Area2  Circle\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %7f  %7f  %7f  %7f  %7f  %7f  %7f  %7f\n', ...
      xc, yc, radius, theta1, theta2, area1, area2, area3 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '       F   Sector1       Sector2         Sum         Circle\n' );
    fprintf ( 1, '\n' );

    for j = 1 : num

      FUNC_2D_INDEX = j;

      resulta = circle_sector ( 'function_2d', xc, yc, radius, theta1, theta2, nr );
      resultb = circle_sector ( 'function_2d', xc, yc, radius, theta2, theta3, nr );

      result1 = resulta + resultb;

      result2 = circle_rt_sum ( 'function_2d', xc, yc, radius, nr2, ra, rw, nt, ta, tw, zw );

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s  %12f  %12f  %12f  %12f\n', ...
        fname, resulta, resultb, resulta + resultb, result2 );

    end

  end

  return
end
