function linpack_s_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests SGBFA and SGBSL.
%
%  Discussion:
%
%    SGBFA and SGBSL are for general banded matrices.
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
  ml = 25;
  mu = 25;
  lda = 2*ml+mu+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  SGBFA factors the matrix,\n' );
  fprintf ( 1, '  SGBSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to matrix A and right hand side B.
%
%  We want to try a problem with a significant bandwidth.
%
  m = ml + mu + 1;
  fprintf ( 1, '  The bandwidth of the matrix is %d\n', m );

  for j = 1 : n

    ilo = max ( 1, j - mu );
    ihi = min ( n, j + ml );

    temp = 0.0;
    for i = ilo : ihi
      a(i-j+m,j) = -1.0;
      temp = temp - 1.0;
    end

    temp = temp + 1.0;
    a(m,j) = 4.0 - temp;
    b(j) = 4.0;

  end
%
%  Force B to be a column vector.
%
  b = b';
%
%  Factor the matrix A.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, ipivot, info ] = sgbfa ( a, lda, n, ml, mu );

  if ( info ~= 0 )
   fprintf ( 1, '  Error!  SGBFA returns INFO = %d\n', info );
    return
  end
%
%  Call SGBSL to solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  job = 0;
  b = sgbsl ( a, lda, n, ml, mu, ipivot, b, job );
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
