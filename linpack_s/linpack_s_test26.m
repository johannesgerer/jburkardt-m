function linpack_s_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests SSPCO.
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
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  For a symmetric indefinite packed matrix,\n' );
  fprintf ( 1, '  SSPCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Assign values to the matrix A.
%
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
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );
 
  [ a, ipvt, rcond, z ] = sspco ( a, n );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition = %f\n', rcond );

  return
end
