function stroud_test42 ( )

%*****************************************************************************80
%
%% TEST42 tests TRIANGLE_UNIT_SET and TRIANGLE_UNIT_SUM.
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

  max_rule = 20;

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST42\n' );
  fprintf ( 1, '  TRIANGLE_UNIT_SET sets up a quadrature\n' );
  fprintf ( 1, '    in the unit triangle,\n' );
  fprintf ( 1, '  TRIANGLE_UNIT_SUM applies it.\n' );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo + 4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:    ' );
    for rule = ilo : ihi
      fprintf ( 1, '%6d', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_2D_INDEX = i;

      for rule = ilo : ihi

        order = triangle_unit_size ( rule );

        [ xtab, ytab, weight ] = triangle_unit_set ( rule, order );
 
        result(rule) = triangle_unit_sum ( 'function_2d', order, xtab, ytab, weight );

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
