function linpack_s_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests SPOFA and SPODI.
%
%  Discussion:
%
%    SPOFA factors a positive definite symmetric matrix,
%    and SPODI can compute the determinant or the inverse.
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
  n = 5;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  SPOFA computes the LU factors,\n' );
  fprintf ( 1, '  SPODI computes the inverse or determinant.\n' );
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
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = spofa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, SPOFA returns INFO = %d\n', info );
    return
  end
%
%  Get the determinant and inverse.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get the determinant and inverse.\n' );
 
  job = 11;
  [ a, det ] = spodi ( a, lda, n, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant  = %f * 10 ^ %f\n', det(1), det(2) );
%
%  SPODI produces only the 'upper half triangle' of the inverse,
%  which is actually symmetric.  Thus, the lower half could be
%  produced by copying from the upper half.  However, the first row
%  of A, as returned, is exactly the first row of the inverse.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First row of inverse:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %14f', a(1,j) );
  end
  fprintf ( 1, '\n' );
 
  return
end
