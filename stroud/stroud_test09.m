function stroud_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests CIRCLE_ANNULUS_SECTOR, CIRCLE_RT_SET, CIRCLE_RT_SUM.
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
  num = function_2d_num ( );

  nr = 5;

  rule = 9;
  [ nr2, nt, nc ] = circle_rt_size ( rule );
  [ ra, rw, ta, tw, zw ] = circle_rt_set ( rule, nr2, nt, nc );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  CIRCLE_ANNULUS_SECTOR estimates an integral in a\n' );
  fprintf ( 1, '    circular annulus sector.\n' );
  fprintf ( 1, '  CIRCLE_RT_SET sets an integration rule in a circle.\n' );
  fprintf ( 1, '  CIRCLE_RT_SUM uses an integration rule in a circle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To test CIRCLE_ANNULUS_SECTOR, we estimate an integral\n' );
  fprintf ( 1, '  over 4 annular sectors that make up the unit circle,\n' );
  fprintf ( 1, '  and add to get RESULT1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will also estimate the integral over the unit circle\n' );
  fprintf ( 1, '  using CIRCLE_RT_SET and CIRCLE_RT_SUM to get RESULT2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will then compare RESULT1 and RESULT2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CIRCLE_ANNULUS_SECTOR computations will use NR = %d\n',nr );
  fprintf ( 1, '  CIRCLE_RT_SET/CIRCLE_RT_SUM will use rule %d\n', rule );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "RESULT1" is the sum of Annulus Sector calculations.\n' );
  fprintf ( 1, '  "RESULT2" is for CIRCLE_RT_SET/CIRCLE_RT_SUM.\n' );
  fprintf ( 1, '\n' );

  xc = 0.0;
  yc = 0.0;
  radius = 1.0;

  radius1a = 0.0;
  radius2a = 0.25;
  theta1a = 0.0;
  theta2a = 0.5 * pi;

  radius1b = 0.0;
  radius2b = 0.25;
  theta1b = 0.5 * pi;
  theta2b = 2.0 * pi;

  radius1c = 0.25;
  radius2c = 1.0;
  theta1c = 0.0;
  theta2c = 0.25 * pi;

  radius1d = 0.25;
  radius2d = 1.0;
  theta1d = 0.25 * pi;
  theta2d = 2.0 * pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       F  Result1  Result2\n' );
  fprintf ( 1, '\n' );

  for j = 1 : num

    FUNC_2D_INDEX = j;

    as1 = circle_annulus_sector ( 'function_2d', xc, yc, radius1a, radius2a, ...
      theta1a, theta2a, nr );

    as2 = circle_annulus_sector ( 'function_2d', xc, yc, radius1b, radius2b, ...
      theta1b, theta2b, nr );

    as3 = circle_annulus_sector ( 'function_2d', xc, yc, radius1c, radius2c, ...
      theta1c, theta2c, nr );

    as4 = circle_annulus_sector ( 'function_2d', xc, yc, radius1d, radius2d, ...
      theta1d, theta2d, nr );

    result1 = as1 + as2 + as3 + as4;

    result2 = circle_rt_sum ( 'function_2d', xc, yc, radius, nr2, ra, rw, nt, ...
      ta, tw, zw );

    fname = function_2d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f\n', fname, result1, result2 );

  end

  return
end
