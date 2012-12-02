function fem_basis_test02 ( )

%*****************************************************************************80
%
%% FEM_BASIS_TEST02 tests FEM_BASIS_2D
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
  fprintf ( 1, 'FEM_BASIS_TEST02\n' );
  fprintf ( 1, '  FEM_BASIS_2D evaluates an arbitrary triangular\n' );
  fprintf ( 1, '  basis function.\n' );

  i1 = 1;
  j1 = 0;
  k1 = 2;
  d = i1 + j1 + k1;
  x1 = i1 / d;
  y1 = j1 / d;
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   K        X           Y      L(I,J,K)(X,Y)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %2d  %2d  %2d  %10.4f  %10.4f  %14.6g\n', ...
    i1, j1, k1, x1, y1, 1.0 );
  fprintf ( 1, '\n' );
  for j2 = 0 : d
    for i2 = 0 : d - j2
      k2 = d - i2 - j2;
      x2 = i2 / d;
      y2 = j2 / d;
      lijk = fem_basis_2d ( i1, j1, k1, x2, y2 );
      fprintf ( 1, '  %2d  %2d  %2d  %10.4f  %10.4f  %14.6g\n', ...
        i2, j2, k2, x2, y2, lijk );
    end
  end

  return
end
