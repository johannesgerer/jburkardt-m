function linpack_s_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests SPOFA and SPOSL.
%
%  Discussion:
%
%    SPOFA factors a positive definite symmetric matrix,
%    and SPOSL can solve a factored linear system.
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
  n = 20;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  SPOFA computes the LU factors.\n' );
  fprintf ( 1, '  SPOSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 2.0;
    if ( 1 < i )
      a(i,i-1) = -1.0;
    end
    if ( i < n )
      a(i,i+1) = -1.0;
    end
  end
%
%  Set the right hand side.
%
  x = zeros ( n, 1 );

  for i = 1 : n
    x(i) = i;
  end
  
  b(1:n) = a(1:n,1:n) * x(1:n);
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = spofa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, SPOFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  b = sposl ( a, lda, n, b );
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first and last five entries of the solution:\n' );
  fprintf ( 1, '  (Should be 1,2,3,4,5,...,n-1,n.)\n' );
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
