function linpack_s_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests SGEFA and SGESL.
%
%  Discussion:
%
%    In this example, we solve a relatively large linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 100;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  SGEFA computes the LU factors;\n' );
  fprintf ( 1, '  SGESL solves a factored linear system;\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to the matrix A and the right hand side B.
%
%  The problem is just an enlarged version of the
%  problem for N = 5, which is:
%
%  Matrix A is ( n -1 -1 -1 -1)    Right hand side B is  (1)
%              (-1  n -1 -1 -1)                          (1)
%              (-1 -1  n -1 -1)                          (1)
%              (-1 -1 -1  n -1)                          (1)
%              (-1 -1 -1 -1  n)                          (1)
%
%  Solution is   (1)
%                (1)
%                (1)
%                (1)
%                (1)
%
  b(1:n) = 1.0;

  a(1:n,1:n) = -1.0;
  for i = 1 : n
    a(i,i) = n;
  end
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix\n' );

  [ a, ipvt, info ] = sgefa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '  SGEFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  job = 0;
  b = sgesl ( a, lda, n, ipvt, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first and last five entries of the solution:\n' );
  fprintf ( 1, '  (All of them should be 1.)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    if ( i <= 5 | n-5 < i )
      fprintf ( 1, '  %6d  %14f\n', i, b(i) );
    end
    if ( i == 5 )
      fprintf ( 1, '  ......  ..............\n' );
    end
  end

  return
end
