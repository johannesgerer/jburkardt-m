function linpack_d_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests DPBFA and DPBSL.
%
%  Discussion:
%
%    DPBFA and DPBSL are for a positive definite symmetric band matrix.
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
  n = 10;
  lda = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  For a positive definite symmetric band matrix,\n' );
  fprintf ( 1, '  DPBFA computes the LU factors.\n' );
  fprintf ( 1, '  DPBSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to matrix A and right hand side B.
%
%  The problem is just an enlarged version of the
%  problem for N = 5, which is:
%
%  Matrix A is ( 2 -1  0  0  0)    right hand side B is  (1)
%              (-1  2 -1  0  0)                          (0)
%              ( 0 -1  2 -1  0)                          (0)
%              ( 0  0 -1  2 -1)                          (0)
%              ( 0  0  0 -1  2)                          (1)
%
%
%  solution is   (1)
%                (1)
%                (1)
%                (1)
%                (1)
%
%  Set the right hand side.
%
  b(1) =     1.0;
  b(2:n-1) = 0.0;
  b(n) =     1.0;
%
%  Set the number of nonzero diagonals.
%
  m = 1;
%
%  Set the value of the subdiagonal and diagonal.
%
  a(1,1:n) = -1.0;
  a(2,1:n) =  2.0;
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );
 
  [ a, info ] = dpbfa ( a, lda, n, m );
 
  if ( info ~= 0 )
    fprintf ( 1, '  Error!  DPBFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );
 
  b = dpbsl ( a, lda, n, m, b );
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
