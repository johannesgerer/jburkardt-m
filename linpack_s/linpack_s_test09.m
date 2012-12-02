function linpack_s_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests SGEFA and SGEDI.
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
  n = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  SGEFA computes the LU factors;\n' );
  fprintf ( 1, '  SGEDI computes the inverse and determinant\n' );
  fprintf ( 1, '  of a factored matrix.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1:3,1:3) = [ ...
    1.0, 2.0, 3.0; ...
    4.0, 5.0, 6.0; ...
    7.0, 8.0, 0.0 ];
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix\n' );

  [ a, ipvt, info ] = sgefa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '  Error!  The matrix is nearly singular!\n' );
    return
  end
%
%  Get the inverse and determinant.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get the inverse and determinant\n' );

  job = 11;
  [ a, det ] = sgedi ( a, lda, n, ipvt, job );

  fprintf ( 1, '\n' );
  fprintf ( 1,'  The determinant = %f * 10 ^ %f\n', det(1), det(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The inverse matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
