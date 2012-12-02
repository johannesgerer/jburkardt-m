function fem_basis_test05 ( )

%*****************************************************************************80
%
%% FEM_BASIS_TEST05 repeats TEST02 using FEM_BASIS_MD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_TEST05\n' );
  fprintf ( 1, '  FEM_BASIS_MD evaluates an arbitrary\n' );
  fprintf ( 1, '  basis function over an M-dimensional simplex.\n' );

  m = 2;
  
  i1 = [ 1, 0, 2 ]';
  d = sum ( i1 );
  x1(1:m) = i1(1:m) / d;
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   K        X           Y      L(I,J,K)(X,Y)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %2d  %2d  %2d  %10.4f  %10.4f  %14.6g\n', ...
    i1(1:m+1), x1(1:m), 1.0 );
  fprintf ( 1, '\n' );
  for p2 = 0 : d
    i2(2) = p2;
    for p1 = 0 : d - p2
      i2(1) = p1;
      i2(m+1) = d - sum ( i2(1:m) );
      x2(1:m) = i2(1:m) / d;
      l = fem_basis_md ( m, i1, x2 );
      fprintf ( 1, '  %2d  %2d  %2d  %10.4f  %10.4f  %14.6g\n', ...
        i2(1:m+1), x2(1:m), l );
    end
  end

  return
end
