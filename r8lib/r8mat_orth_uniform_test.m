function r8mat_orth_uniform_test ( )

%*****************************************************************************80
%
%% R8MAT_ORTH_UNIFORM_TEST tests R8MAT_ORTH_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_ORTH_UNIFORM_TEST\n' );
  fprintf ( 1, '  R8MAT_ORTH_UNIFORM computes a random orthogonal matrix.\n' );

  seed = 123456789;

  [ a, seed ] = r8mat_orth_uniform ( n, seed );

  r8mat_print ( n, n, a, '  Random orthogonal matrix A' );

  ata(1:n,1:n) = a(1:n,1:n)' * a(1:n,1:n);

  r8mat_print ( n, n, ata, '  AT*A' );

  return
end
