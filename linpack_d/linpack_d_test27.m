function linpack_d_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests DSPFA and DSPSL.
%
%  Discussion:
%
%    DSPFA and DSPSL are for packed symmetric indefinite matrices.
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
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  For a symmetric indefinite packed matrix,\n' );
  fprintf ( 1, '  DSPFA factors the matrix,\n' );
  fprintf ( 1, '  DSPSL solves a factored linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to the matrix A and the right hand side B.
%
  b(1:n-1) = 0.0;
  b(n)= n + 1;

  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      if ( i == j )
        a(k) = 2.0;
      elseif ( j == i+1 )
        a(k) = -1.0;
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
 
  [ a, ipvt, info ] = dspfa ( a, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '  Error!  DSPFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );
 
  b = dspsl ( a, n, ipvt, b );
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
