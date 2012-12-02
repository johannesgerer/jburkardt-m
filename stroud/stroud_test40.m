function stroud_test40 ( )

%*****************************************************************************80
%
%% TEST40 tests TETRA_UNIT_SET, TETRA_SUM.
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

  x = [ 1.0, 4.0, 1.0, 1.0 ];
  y = [ 2.0, 2.0, 3.0, 2.0 ];
  z = [ 6.0, 6.0, 6.0, 8.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST40\n' );
  fprintf ( 1, '  TETRA_UNIT_SET sets quadrature rules\n' );
  fprintf ( 1, '    for the unit tetrahedron;\n' );
  fprintf ( 1, '  TETRA_SUM applies them to an arbitrary tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron vertices:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 4
    fprintf ( 1, '  %3f  %3f  %3f\n', x(i), y(i), z(i) );
  end

  for ilo = 1 : 5 : max_rule

    ihi = min ( ilo +  4, max_rule );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule:    ' );
    for rule = ilo : ihi
      fprintf ( 1, '%7d       ', rule );
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
 
        result(rule) = tetra_sum ( 'function_3d', x, y, z, order, xtab, ytab, ztab, weight );

      end

      fname = function_3d_name ( i );

      fprintf ( 1, '  %s', fname );
      for rule = ilo : ihi
        fprintf ( 1, '  %12f', result(rule) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
