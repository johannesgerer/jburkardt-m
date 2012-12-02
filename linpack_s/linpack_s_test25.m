function linpack_s_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests SSIFA and SSISL.
%
%  Discussion:
%
%    SSIFA and SSISL are for symmetric indefinite matrices.
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
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  For a symmetric indefinite matrix,\n' );
  fprintf ( 1, '  SSIFA factors the matrix,\n' );
  fprintf ( 1, '  SSISL solves a factored linear system,\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to the matrix A and the right hand side B.
%
  b(1:n-1) = 0.0;
  b(n)= n + 1;
%
%  Force B to be a column vector.
%
  b = b';
  
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 2.0;
    if ( i < n )
      a(i,i+1) = -1.0;
    end
  end
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );
 
  [ a, ipvt, info ] = ssifa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '  Error!  SSIFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );
 
  b = ssisl ( a, lda, n, ipvt, b );
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
