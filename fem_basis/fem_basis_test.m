function fem_basis_test ( )

%*****************************************************************************80
%
%% FEM_BASIS_TEST tests the FEM_BASIS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the FEM_BASIS library.\n' );

  fem_basis_test01 ( );
  fem_basis_test02 ( );
  fem_basis_test03 ( );
%
%  Repeat the tests, now using FEM_BASIS_MD.
%
  fem_basis_test04 ( );
  fem_basis_test05 ( );
  fem_basis_test06 ( );
%
%  Tests for triangular prism.
%
  fem_basis_test07 ( );
  fem_basis_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_BASIS_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
