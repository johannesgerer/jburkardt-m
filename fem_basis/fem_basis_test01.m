function fem_basis_test01 ( )

%*****************************************************************************80
%
%% FEM_BASIS_TEST01 tests FEM_BASIS_1D
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
  fprintf ( 1, 'FEM_BASIS_TEST01\n' );
  fprintf ( 1, '  FEM_BASIS_1D evaluates an arbitrary\n' );
  fprintf ( 1, '  basis function over an interval.\n' );

  i1 = 2;
  j1 = 1;
  d = i1 + j1;
  x1 = i1 / d;
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J        X          L(I,J)(X)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %2d  %2d  %10.4f  %14.6g\n', i1, j1, x1, 1.0 );
  fprintf ( 1, '\n' );
  for i2 = 0 : d
    j2 = d - i2;
    x2 = i2 / d;
    lij = fem_basis_1d ( i1, j1, x2 );
    fprintf ( 1, '  %2d  %2d  %10.4f  %14.6g\n', i2, j2, x2, lij );
  end

  return
end
