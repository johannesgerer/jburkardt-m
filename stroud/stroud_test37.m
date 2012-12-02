function stroud_test37 ( )

%*****************************************************************************80
%
%% TEST37 tests SQUARE_UNIT_SET, SQUARE_UNIT_SUM.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  SQUARE_UNIT_SET sets up quadrature on the unit square;\n' );
  fprintf ( 1, '  SQUARE_UNIT_SUM carries it out on the unit square.\n' );
  fprintf ( 1, '\n' );
 
  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo + 4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:    ' );
    for rule = ilo : ihi
      fprintf ( 1, '  %6d     ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        order = square_unit_size ( rule );

        [ xtab, ytab, weight ] = square_unit_set ( rule, order );

        result(rule) = square_unit_sum ( 'function_2d', order, xtab, ytab, weight );

      end

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s', fname );
      for rule = ilo : ihi
        fprintf ( 1, '  %11f', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end
 
  return
end
