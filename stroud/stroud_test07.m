function stroud_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests CIRCLE_ANNULUS.
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

  ntest = 2;

  radius1_test = [ 0.0, 1.0 ];
  radius2_test = [ 1.0, 2.0 ];
  xc_test = [ 0.0, 0.0 ];
  yc_test = [ 0.0, 0.0 ];

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  CIRCLE_ANNULUS estimates integrals\n' );
  fprintf ( 1, '    in a circular annulus.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '        F   XC        YC       Radius1   Radius2   NR  Result\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    xc = xc_test(i);
    yc = yc_test(i);
    radius1 = radius1_test(i);
    radius2 = radius2_test(i);

    area = circle_annulus_area_2d ( radius1, radius2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     Area  %8f  %8f  %8f  %8f  %8f\n', ...
      xc, yc, radius1, radius2, area );

    for j = 1 : num

      FUNC_2D_INDEX = j;

      for nr = 1 : 4

        result = circle_annulus ( 'function_2d', xc, yc, radius1, radius2, nr );

        fname = function_2d_name ( i );

        fprintf ( 1, '  %s  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
          fname, xc, yc, radius1, radius2, nr, result );

      end

    end

  end

  return
end
