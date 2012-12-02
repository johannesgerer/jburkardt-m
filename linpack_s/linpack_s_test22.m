function linpack_s_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests SPTSL.
%
%  Discussion:
%
%    SPTSL factors and solves a positive definite symmetric tridiagonal system.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  For a positive definite symmetric tridiagonal matrix,\n' );
  fprintf ( 1, '  SPTSL factors and solves a linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  for i = 1 : n
    x(i) = i;
  end

  b(1:n) =    0.0;
  d(1:n) =    2.0;
  e(1:n-1) = -1.0;
  e(n) =      0.0;

  for i = 1 : n

    if ( 1 < i )
      b(i) = b(i) + e(i-1) * x(i-1);
    end
    b(i) = b(i) + d(i) * x(i);
    if ( i < n )
      b(i) = b(i) + e(i) * x(i+1);
    end

  end
%
%  Factor and solve the system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix and solve the system.\n' );

  b = sptsl ( n, d, e, b );
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first and last five entries of the solution:\n' );
  fprintf ( 1, '  (Should be 1,2,3,4,5,...,n-1,n):\n' );
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
