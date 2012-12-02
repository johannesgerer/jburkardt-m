function linpack_z_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests ZGBCO.
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
  ml = 1;
  mu = 1;
  n = 3;
  lda = 2*ml+mu+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For a complex general band storage matrix:\n' );
  fprintf ( 1, '  ZGBCO factors the matrix and estimates the\n' );
  fprintf ( 1, '  reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
  fprintf ( 1, '  The lower band is ML =  %d\n', ml );
  fprintf ( 1, '  The upper band is MU =  %d\n', mu );
%
%  Set the values of the matrix A.
%
  a_save(1:n,1:n) = 0.0;

  m = ml + mu + 1;

  seed = 123456789;

  for j = 1 : n
    i1 = max ( 1, j - mu );
    i2 = min ( n, j + ml );
    for i = i1 : i2
      k = i - j + m;
      [ a(k,j), seed ] = c8_uniform_01 ( seed );
      a_save(i,j) = a(k,j);
    end
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
  [ a, ipvt, rcond ] = zgbco ( a, lda, n, ml, mu );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end
