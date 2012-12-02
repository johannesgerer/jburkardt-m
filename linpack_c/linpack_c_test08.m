function linpack_c_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests CGEFA and CGESL.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  For a complex general storage matrix:\n' );
  fprintf ( 1, '  CGEFA factors the matrix.\n' );
  fprintf ( 1, '  CGESL solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  [ a, seed ] = c4mat_uniform_01 ( n, n, seed );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix:\n' );
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
  [ x(1:n,1), seed ] = c4vec_uniform_01 ( n, seed );

  b(1:n,1) = a(1:n,1:n) * x(1:n,1);
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The right hand side:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( b(i,1) ), imag ( b(i,1) ) );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, info ] = cgefa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  CGEFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Solve the system.
%
  job = 0;
  b(1:n,1) = cgesl ( a, lda, n, ipvt, b, job );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( b(i,1) ), imag ( b(i,1) ), real ( x(i,1) ), imag ( x(i,1) ) );
  end
 
  return
end
