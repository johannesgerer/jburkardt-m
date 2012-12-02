function linpack_c_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests CHPCO.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix using packed storage (HP),\n' );
  fprintf ( 1, '  CHPCO factors the matrix and estimates\n' );
  fprintf ( 1, '  the reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  k = 0;
  seed = 123456789;

  for j = 1 : n

    for i = 1 : j-1
      k = k + 1;
      [ a(k), seed ] = c4_uniform_01 ( seed );
      a_save(i,j) = a(k);
      a_save(j,i) = conj ( a(k) );
    end

    k = k + 1;
    [ a(k), seed ] = r4_uniform_01 ( seed );
    a_save(j,j) = a(k);

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a_save(i,j) ), imag ( a_save(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, rcond ] = chpco ( a, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end
