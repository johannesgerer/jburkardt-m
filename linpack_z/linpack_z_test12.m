function linpack_z_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests ZHIFA and ZHISL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix (HI):\n' );
  fprintf ( 1, '  ZHIFA factors the matrix.\n' );
  fprintf ( 1, '  ZHISL solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  for i = 1 : n
    [ a(i,i), seed ] = r8_uniform_01 ( seed );
    for j = i+1 : n
      [ a(i,j), seed ] = c8_uniform_01 ( seed );
      a(j,i) = conj ( a(i,j) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Set the values of the right hand side vector B.
%
  [ x, seed ] = c8vec_uniform_01 ( n, seed );

  b(1:n) = a(1:n,1:n) * transpose ( x(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The right hand side B:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( b(i) ), imag ( b(i) ) );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, info ] = zhifa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZHIFA returned an error flag INFO = %d', info );
    return
  end
%
%  Solve the system.
%
  b = zhisl ( a, lda, n, ipvt, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( b(i) ), imag ( b(i) ), real ( x(i) ), imag ( x(i) ) );
  end

  return
end
