function stroud_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests CIRCLE_ANNULUS, CIRCLE_RT_SET, CIRCLE_RT_SUM.
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

  ntest = 3;

  radius1_test = [ 0.0, 1.0, 1.0 ];
  radius2_test = [ 1.0, 2.0, 3.0 ];
  xc_test = [ 0.0, 0.0, 0.0 ];
  yc_test = [ 0.0, 0.0, 0.0 ];

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  CIRCLE_ANNULUS estimates integrals in a \n' );
  fprintf ( 1, '    circular annulus.\n' );
  fprintf ( 1, '  CIRCLE_RT_SET sets up a rule for a circle;\n' );
  fprintf ( 1, '  CIRCLE_RT_SUM applies the rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RESULT1 = CIRCLE_ANNULUS result.\n' );
  fprintf ( 1, '  RESULT2 = Difference of two CIRCLE_SUM_RT results.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '        F   XC        YC       Radius1   Radius2   Result1 Result2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    xc = xc_test(i);
    yc = yc_test(i);
    radius1 = radius1_test(i);
    radius2 = radius2_test(i);

    area = circle_annulus_area_2d ( radius1, radius2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     Area  %7f  %7f  %7f  %7f  %11f\n', ...
      xc, yc, radius1, radius2, area );

    rule = 9;
    [ nr2, nt, nc ] = circle_rt_size ( rule );

    [ ra, rw, ta, tw, zw ] = circle_rt_set ( rule, nr2, nt, nc );

    for j = 1 : num

      FUNC_2D_INDEX = j;

      nr = 5;
      result1 = circle_annulus ( 'function_2d', xc, yc, radius1, radius2, nr );

      result2 = circle_rt_sum ( 'function_2d', xc, yc, radius1, nr2, ra, rw, ...
        nt, ta, tw, zw );

      result3 = circle_rt_sum ( 'function_2d', xc, yc, radius2, nr2, ra, rw, ...
        nt, ta, tw, zw );

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s  %7f  %7f  %7f  %7f  %11f  %11f\n', ...
          fname, xc, yc, radius1, radius2, result1, result3 - result2 );

    end

  end

  return
end
