function linpack_c_test28 ( )

%*****************************************************************************80
%
%% TEST28 tests CSICO.
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
  n = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST28\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  symmetric matrix (SI):\n' );
  fprintf ( 1, '  CSICO factors the matrix and estimates\n' );
  fprintf ( 1, '  the reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  for i = 1 : n
    [ a(i,i), seed ] = c4_uniform_01 ( seed );
    for j = i+1 : n
      [ a(i,j), seed ] = c4_uniform_01 ( seed );
      a(j,i) = a(i,j);
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A is \n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, rcond ] = csico ( a, lda, n );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end
