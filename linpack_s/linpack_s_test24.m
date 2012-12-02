function linpack_s_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests SSICO.
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
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  For a symmetric indefinite matrix,\n' );
  fprintf ( 1, '  SSICO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to the matrix A.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 2.0;
    if ( i < n )
      a(i,i+1) = -1.0;
    end
  end
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );
 
  [ a, ipvt, rcond, z ] = ssico ( a, lda, n );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition = %f\n', rcond );

  return
end
