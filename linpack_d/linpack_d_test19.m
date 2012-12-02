function linpack_d_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests DPPCO.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  For a positive definite symmetric packed matrix,\n' );
  fprintf ( 1, '  DPPCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      if ( i == j - 1 )
        a(k) = -1.0;
      elseif ( i == j )
        a(k) = 2.0;
      else
        a(k) = 0.0;
      end
    end
  end
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition number.\n' );

  [ a, rcond, z, info ] = dppco ( a, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition number = %f\n', rcond );

  return
end
