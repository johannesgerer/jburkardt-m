function fem_basis_test03 ( )

%*****************************************************************************80
%
%% FEM_BASIS_TEST03 tests FEM_BASIS_3D
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_TEST03\n' );
  fprintf ( 1, '  FEM_BASIS_3D evaluates an arbitrary tetrahedral\n' );
  fprintf ( 1, '  basis function.\n' );

  i1 = 1;
  j1 = 0;
  k1 = 2;
  l1 = 1;
  d = i1 + j1 + k1 + l1;
  x1 = i1 / d;
  y1 = j1 / d;
  z1 = k1 / d;
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   K   L        X           Y           Z      L(I,J,K,L)(X,Y,Z)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %2d  %2d  %2d  %2d  %10.4f  %10.4f  %10.4f  %14.6g\n', ...
    i1, j1, k1, l1, x1, y1, z1, 1.0 );
  fprintf ( 1, '\n' );
  for k2 = 0 : d
    for j2 = 0 : d - k2
      for i2 = 0 : d - j2 - k2
        l2 = d - i2 - j2 - k2;
        x2 = i2 / d;
        y2 = j2 / d;
        z2 = k2 / d;
        lijkl = fem_basis_3d ( i1, j1, k1, l1, x2, y2, z2 );
        fprintf ( 1, '  %2d  %2d  %2d  %2d  %10.4f  %10.4f  %10.4f  %14.6g\n', ...
          i2, j2, k2, l2, x2, y2, z2, lijkl );
      end
    end
  end

  return
end
