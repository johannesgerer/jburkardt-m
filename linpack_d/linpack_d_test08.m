function linpack_d_test08 ( )

%*****************************************************************************80
%
%% TEST08 calls DGECO and DGESL.
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
%    LDA defines the maximum matrix size we will use.
%
  lda = 10;
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  DGECO computes the LU factors and computes\n' );
  fprintf ( 1, '  its reciprocal condition number;\n' );
  fprintf ( 1, '  DGESL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1:3,1:3) = [ ...
    1.0, 2.0, 3.0; ...
    4.0, 5.0, 6.0; ...
    7.0, 8.0, 0.0 ];
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, ipvt, rcond, z ] = dgeco ( a, lda, n );

  fprintf ( 1, '  The reciprocal matrix condition number = %f\n', rcond );

  if ( rcond + 1.0 == 1.0 )
    fprintf ( 1, '  Error!  The matrix is nearly singular!\n' );
    return
  end
%
%  Set a right hand side.
%
  b(1:3) = [ 6.0, 15.0, 15.0 ]';
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  job = 0;
  b = dgesl ( a, lda, n, ipvt, b, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution returned by DGESL\n' );
  fprintf ( 1, '  (Should be (1,1,1))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %14f\n', b(i) );
  end
%
%  A second right hand side can be solved without refactoring a.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call DGESL for a new right hand\n' );
  fprintf ( 1, '  side for the same, factored matrix.\n' );
%
%  Set the right hand side.
%
  b(1:3) = [ 1.0, 4.0, 7.0 ]';
%
%  Solve the system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve a linear system.\n' );

  job = 0;
  b = dgesl ( a, lda, n, ipvt, b, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution returned by DGESL\n' );
  fprintf ( 1, '  (should be (1,0,0))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %14f\n', b(i) );
  end
%
%  The transposed problem A'*X = B can be solved by DGESL
%  as well, without any refactoring.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call DGESL for transposed problem.\n' );
%
%  Set the right hand side.
%
  b(1:3) = [ 6.0, 6.0, -3.0 ]';
%
%  Solve the transposed system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call DGESL to solve a transposed linear system.\n' );

  job = 1;
  b = dgesl ( a, lda, n, ipvt, b, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution returned by DGESL\n' );
  fprintf ( 1, '  (should be (-1,0,1))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %14f\n', b(i) );
  end

  return
end
