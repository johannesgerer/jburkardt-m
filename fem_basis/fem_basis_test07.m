function test07 ( )

%*****************************************************************************80
%
%% TEST07 tests FEM_BASIS_PRISM_TRIANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  FEM_BASIS_PRISM_TRIANGLE evaluates an arbitrary\n' );
  fprintf ( 1, '  basis function over a right triangular prism.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we generate basis functions which can be\n' );
  fprintf ( 1, '  up to degree 2 in X and Y, and up to degree 2 in Z.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Choose a node N1, define the basis function associated\n' );
  fprintf ( 1, '  with that node, and then evaluate it at all other nodes.\n' );

  i1(1:3) = [ 2, 0, 0 ]';
  di = sum ( i1(1:3) );
  xyz1(1) = i1(1) / di;
  xyz1(2) = i1(2) / di;

  j1(1:2) = [ 1, 1 ]';
  dj = sum ( j1(1:2) );
  xyz1(3) = j1(1) / dj;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1  I2  I3  J1  J2        X           Y           Z          B(X,Y,Z)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %2d  %2d  %2d  %2d  %2d  %10f  %10f  %10f  %14g\n', ...
    i1(1:3), j1(1:2), xyz1(1:3), 1.0 );
  fprintf ( 1, '\n' );

  for i_1 = 0 : di
    i2(1) = i_1;
    xyz2(1) = i2(1) / di;
    for i_2 = 0 : di - i2(1)
      i2(2) = i_2;
      xyz2(2) = i2(2) / di;
      i2(3) = di - i2(1) - i2(2);
      for j_1 = 0 : dj
        j2(1) = j_1;
        j2(2) = dj - j2(1);
        xyz2(3) = j2(1) / dj;

        b = fem_basis_prism_triangle ( i1, j1, xyz2 );

        fprintf ( 1, '  %2d  %2d  %2d  %2d  %2d  %10f  %10f  %10f  %14g\n', ...
         i2(1:3), j2(1:2), xyz2(1:3), b );

      end
    end
  end

  return
end
