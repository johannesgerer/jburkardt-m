function stroud_test36 ( )

%*****************************************************************************80
%
%% TEST36 tests SQUARE_UNIT_SET, SQUARE_SUM.
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

  max_rule = 6;

  num = function_2d_num ( );

  xc = 2.0;
  yc = 2.0;
  r = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST36\n' );
  fprintf ( 1, '  SQUARE_UNIT_SET sets up quadrature on the unit square;\n' );
  fprintf ( 1, '  SQUARE_SUM carries it out on an arbitrary square.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Square center:\n' );
  fprintf ( 1, '  XC = %f\n', xc );
  fprintf ( 1, '  YC = %f\n', yc );
  fprintf ( 1, '  Square radius is %f\n', r );

  for ilo = 1: 5 : max_rule

    ihi = min ( ilo + 4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:  ' );
    for rule = ilo : ihi
      fprintf ( 1, '  %7d    ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        order = square_unit_size ( rule );

        [ xtab, ytab, weight ] = square_unit_set ( rule, order );

        result(rule) = square_sum ( 'function_2d', xc, yc, r, order, xtab, ...
          ytab, weight );

      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s', fname );
      for rule = ilo : ihi
        fprintf ( 1, '  %14e', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end
 
  return
end
