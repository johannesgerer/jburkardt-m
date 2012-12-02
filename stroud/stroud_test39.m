function stroud_test39 ( )

%*****************************************************************************80
%
%% TEST39 tests TETRA_UNIT_SET, TETRA_UNIT_SUM.
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
  global FUNC_3D_INDEX;

  max_rule = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST39\n' );
  fprintf ( 1, '  TETRA_UNIT_SET sets quadrature rules\n' );
  fprintf ( 1, '    for the unit tetrahedron;\n' );
  fprintf ( 1, '  TETRA_UNIT_SUM applies them to the unit tetrahedron.\n' );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo +  4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:   ' );
    for rule = ilo : ihi
      fprintf ( 1, '  %6d     ', rule );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function\n' );
    fprintf ( 1, '\n' );

    num = function_3d_num ( );

    for i = 1 : num

      FUNC_3D_INDEX = i;

      for rule = ilo : ihi

        order = tetra_unit_size ( rule );

        [ xtab, ytab, ztab, weight ] = tetra_unit_set ( rule, order );
 
        result(rule) = tetra_unit_sum ( ...
          'function_3d', order, xtab, ytab, ztab, weight );

      end

      fname = function_3d_name ( i );

      fprintf ( 1, '  %s', fname );
      for rule = ilo : ihi
        fprintf ( 1, '  %11f', result(rule) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
