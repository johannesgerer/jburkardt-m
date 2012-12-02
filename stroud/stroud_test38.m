function stroud_test38 ( )

%*****************************************************************************80
%
%% TEST38 tests TETRA_07, TETRA_TPRODUCT.
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

  max_order = 9;

  x = [ 1.0, 4.0, 1.0, 1.0 ];
  y = [ 2.0, 2.0, 3.0, 2.0 ];
  z = [ 6.0, 6.0, 6.0, 8.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST38\n' );
  fprintf ( 1, '  For integrals inside an arbitrary tetrahedron:\n' );
  fprintf ( 1, '  TETRA_07 uses a formula of degree 7;\n' );
  fprintf ( 1, '  TETRA_TPRODUCT uses a triangular product formula\n' );
  fprintf ( 1, '    of varying degree.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron vertices:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 4
    fprintf ( 1, '  %4f  %4f  %4f\n', x(i), y(i), z(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tetrahedron unit volume = %f\n', tetra_unit_volume ( ) );
  fprintf ( 1, '  Tetrahedron Volume = %f\n', tetra_volume ( x, y, z ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X)    TETRA_07\n' );
  fprintf ( 1, '          TETRA_TPRODUCT(1:4)\n' );
  fprintf ( 1, '          TETRA_TPRODUCT(5:8)\n' );
  fprintf ( 1, '          TETRA_TPRODUCT(9)\n' );
  fprintf ( 1, '\n' );

  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result2 = tetra_07 ( 'function_3d', x, y, z );

    for norder = 1 : max_order
      result3(norder) = tetra_tproduct ( 'function_3d', norder, x, y, z );
    end

    fname = function_3d_name ( i );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %s  %14f\n', fname, result2 );
    fprintf ( 1, '           %14f  %14f  %14f  %14f\n', result3(1:4) );
    fprintf ( 1, '           %14f  %14f  %14f  %14f\n', result3(5:8) );
    fprintf ( 1, '           %14f\n',                   result3(9) );

  end

  return
end
