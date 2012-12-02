function linpack_d_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests DGBFA and DGBSL.
%
%  Discussion:
%
%    The problem solved here is a larger version of this one:
%
%    Matrix A is ( 2 -1  0  0  0)    right hand side B is  (1)
%                (-1  2 -1  0  0)                          (0)
%                ( 0 -1  2 -1  0)                          (0)
%                ( 0  0 -1  2 -1)                          (0)
%                ( 0  0  0 -1  2)                          (1)
%
%
%    Solution is   (1)
%                  (1)
%                  (1)
%                  (1)
%                  (1)
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
%  Local Parameters:
%
%    N is the number of equations.
%
%    ML is the number of subdiagonals,
%    MU the number of superdiagonals.
%
%    LDA is the leading dimension of the array used to store the
%    matrix, which must be at least 2*ML+MU+1.
%
  n = 10;
  ml = 1;
  mu = 1;
  lda = 2*ml+mu+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  DGBFA factors the matrix,\n' );
  fprintf ( 1, '  DGBSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the right hand side B.
%
  b(1) = 1.0;
  b(2:n-1) = 0.0;
  b(n) = 1.0;
%
%  Force B to be a column vector.
%
  b = b';
%
%  Set the matrix A.
%
  m = ml + mu + 1;
  fprintf ( 1, '  The bandwidth of the matrix is %d\n', m );

  for j = 1 : n
    a(m-1,j) = -1.0;
    a(m,j) = 2.0;
    a(m+1,j) = -1.0;
  end
%
%  Call DGBFA to factor the matrix A.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, ipivot, info ] = dgbfa ( a, lda, n, ml, mu );

  if ( info ~= 0 )
    fprintf ( 1, '  Error!  DGBFA returns INFO = %d\n', info );
    return
  end
%
%  Call DGBSL to solve the linear system.  The solution
%  is returned in B, that is, it overwrites the right hand side.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  job = 0;
  b = dgbsl ( a, lda, n, ml, mu, ipivot, b, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first and last 5 entries of the solution:\n' );
  fprintf ( 1, '  (All should be 1):\n' );
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
