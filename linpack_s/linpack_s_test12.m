function linpack_s_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests SGTSL.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For a general tridiagonal matrix,\n' );
  fprintf ( 1, '  SGTSL factors and solves a linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
  fprintf ( 1, '\n' );
%
%  Set up the linear system, by storing the values of the
%  subdiagonal, diagonal, and superdiagonal in C, D, and E,
%  and the right hand side in B.
%
  c(1) = 0.0;
  c(2:n) = -1.0;

  d(1:n) = 2.0;

  e(1:n-1) = -1.0;
  e(n) = 0.0;

  b(1:n-1) = 0.0;
  b(n) = n + 1;
%
%  Factor and solve the system in one step.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix and solve the system.\n' );

  [ b, info ] = sgtsl ( n, c, d, e, b );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SGTSL returns nonzero INFO = %d\n', info );
    return
  end
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first and last 5 entries of the solution:\n' );
  fprintf ( 1, '  (Should be 1,2,3,4,5,...,n,n-1):\n' );
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
