function linpack_d_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests DPOCO.
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
  n = 5;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  DPOCO estimates the reciprocal condition number.\n' );
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
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );

  [ a, rcond, z, info ] = dpoco ( a, lda, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition  = %f\n', rcond );

  return
end
