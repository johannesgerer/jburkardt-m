function stroud_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests CIRCLE_XY_SET, CIRCLE_XY_SUM.
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

  max_order = 64;
  max_rule = 13;
  num = function_2d_num ( );
  xc = 1.0;
  yc = 1.0;
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  CIRCLE_XY_SET sets a quadrature rule\n' );
  fprintf ( 1, '    for the unit circle.\n' );
  fprintf ( 1, '  CIRCLE_XY_SUM evaluates the quadrature rule\n' );
  fprintf ( 1, '    in an arbitrary circle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a radius %f\n', r );
  fprintf ( 1, '  and center:\n' );
  fprintf ( 1, '  XC = %f\n', xc );
  fprintf ( 1, '  YC = %f\n', yc );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo +  4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:         ' );
    for rule = ilo : ihi
      fprintf ( 1, '%7d       ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        order = circle_xy_size ( rule );
        [ xtab, ytab, weight ] = circle_xy_set ( rule, order );

        result(rule) = circle_xy_sum ( 'function_2d', xc, yc, r, order, xtab, ...
          ytab, weight );

      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s' );
      for rule = ilo : ihi
        fprintf ( 1, '  %12f', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
