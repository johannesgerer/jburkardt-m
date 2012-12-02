function stroud_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests CUBE_UNIT_3D, QMULT_3D, RECTANGLE_3D.
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

  a1 = -1.0;
  b1 = +1.0;

  a(1) = -1.0;
  a(2) = -1.0;
  a(3) = -1.0;
  b(1) = 1.0;
  b(2) = 1.0;
  b(3) = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  CUBE_UNIT_3D approximates integrals\n' );
  fprintf ( 1, '    in the unit cube in 3D.\n' );
  fprintf ( 1, '  QMULT_3D approximates triple integrals.\n' );
  fprintf ( 1, '  RECTANGLE_3D approximates integrals\n' );
  fprintf ( 1, '    in a rectangular block.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    F(X)    CUBE_UNIT_3D  QMULT_3D      RECTANGLE_3D\n' );
  fprintf ( 1, '\n' );

  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result1 = cube_unit_3d ( 'function_3d' );
    result2 = qmult_3d ( 'function_3d', a1, b1, 'fu18', 'fl18', 'fu28', 'fl28' );
    result3 = rectangle_3d ( 'function_3d', a, b );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f  %12f\n', ...
      fname, result1, result2, result3 );

  end

  return
end
