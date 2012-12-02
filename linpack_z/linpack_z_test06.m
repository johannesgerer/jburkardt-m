function linpack_z_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests ZGBFA and ZGBDI.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  For a complex general band storage matrix:\n' );
  fprintf ( 1, '  ZGBFA factors the matrix.\n' );
  fprintf ( 1, '  ZGBDI computes the determinant.\n' );
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
  fprintf ( 1, '  The matrix:\n' );
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
  [ a, ipvt, info ] = zgbfa ( a, lda, n, ml, mu );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZGBFA returned INFO = %d\n', info );
    return
  end
%
%  Get the determinant.
%
  det = zgbdi ( a, lda, n, ml, mu, ipvt );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = (%f  %f) * 10^%f\n', ...
    real ( det(1) ), imag ( det(1) ), real ( det(2) ) );

  return
end
