function linpack_d_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests DPPFA and DPPSL.
%
%  Discussion:
%
%    DPOFA factors a positive definite symmetric matrix,
%    and DPOSL can solve a factored linear system.
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
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  For a positive definite symmetric packed matrix,\n' );
  fprintf ( 1, '  DPPFA factors the matrix.\n' );
  fprintf ( 1, '  DPPSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  for i = 1 : n
    x(i) = i;
  end

  b(1:n) = 0.0;

  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      if ( i == j - 1 )
        a(k) = -1.0;
        b(i) = b(i) + a(k) * x(j);
        b(j) = b(j) + a(k) * x(i);
      elseif ( i == j )
        a(k) = 2.0;
        b(i) = b(i) + a(k) * x(i);
      else
        a(k) = 0.0;
      end
    end
  end
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = dppfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, DPPFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  b = dppsl ( a, n, b );
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
