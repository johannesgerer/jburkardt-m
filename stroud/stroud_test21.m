function stroud_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests HEXAGON_UNIT routines.
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

  max_rule = 4;

  num = function_2d_num ( );

  xc = 0.0;
  yc = 0.0;
  rad = 2.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  For integration over the unit hexagon,\n' );
  fprintf ( 1, '  HEXAGON_UNIT_SIZE sizes a quadrature rule.\n' );
  fprintf ( 1, '  HEXAGON_UNIT_SET sets a quadrature rule.\n' );
  fprintf ( 1, '  HEXAGON_SUM evaluates a quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a radius %f\n', rad );
  fprintf ( 1, '  and center:\n' );
  fprintf ( 1, '  XC = %f\n', xc );
  fprintf ( 1, '  YC = %f\n', yc );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo + 4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:    ' );
    for rule = ilo : ihi
      fprintf ( 1, '   %4d       ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        order = hexagon_unit_size ( rule );

        [ xtab, ytab, weight ] = hexagon_unit_set ( rule, order );

        result(rule) = hexagon_sum ( 'function_2d', xc, yc, rad, order, xtab, ...
          ytab, weight );

      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s', fname );
      for rule = ilo : ihi
        fprintf ( 1, '  %12f', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
