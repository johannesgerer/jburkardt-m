function linpack_s_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests SGBCO.
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
  n = 10;
  ml = 1;
  mu = 1;
  lda = 2 * ml + mu + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  SGBCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  m = ml + mu + 1;
  fprintf ( 1, '  The bandwidth of the matrix is %d\n', m );
 
  for j = 1 : n
    a(m-1,j) = -1.0;
    a(m,  j) =  2.0;
    a(m+1,j) = -1.0;
  end
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );
 
  [ a, ipivot, rcond, z ] = sgbco ( a, lda, n, ml, mu );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition = %f\n', rcond );

  return
end
