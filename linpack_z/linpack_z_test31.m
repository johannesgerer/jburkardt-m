function linpack_z_test31 ( )

%*****************************************************************************80
%
%% TEST31 tests ZSPCO.
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

  fprintf ( 1, '\n' )
  fprintf ( 1, 'TEST31\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  symmetric matrix in packed storage (SP),\n' );
  fprintf ( 1, '  ZSPCO factors the matrix and estimates\n' );
  fprintf ( 1, '  the reciprocal condition number.\n' );
  fprintf ( 1, '\n' )
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the packed matrix A.
%
  k = 0;
  seed = 123456789;

  for j = 1 : n

    for i = 1 : j-1
      k = k + 1;
      [ a(k), seed ] = c8_uniform_01 ( seed );
    end

    k = k + 1;
    [ a(k), seed ] = c8_uniform_01 ( seed );

  end
%
%  Copy the packed matrix into a "normal" matrix.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      a_save(i,j) = a(k);
    end
  end

  for j = 1 : n
    a_save(j+1:n,j) = transpose ( a_save(j,j+1:n) );
  end

  fprintf ( 1, '\n' )
  fprintf ( 1, '  The matrix A is\n' );
  fprintf ( 1, '\n' )

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a_save(i,j) ), imag ( a_save(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, rcond ] = zspco ( a, n );

  fprintf ( 1, '\n' )
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end
