function stroud_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests CIRCLE_CUM.
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

  r = 3.0;
  xc = 0.0;
  yc = 0.0;

  num = function_2d_num ( );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10 \n' );
  fprintf ( 1, '  CIRCLE_CUM approximates an integral over a circle. \n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use radius R = %f\n', r );
  fprintf ( 1, '  and center: \n' );
  fprintf ( 1, '  XC = %f\n', xc );
  fprintf ( 1, '  YC = %f\n', yc );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    Order:      2             4              8            16 \n' );
  fprintf ( 1, '  F(X) \n' );
  fprintf ( 1, '\n' );

  for i = 1 : num

    FUNC_2D_INDEX = i;

    for j = 1 : 4

      norder = 2^j;

      result(j) = circle_cum ( 'function_2d', xc, yc, r, norder );

    end

    fname = function_2d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f  %12f  %12f\n', fname, result(1:4) );
 
  end

  return
end
