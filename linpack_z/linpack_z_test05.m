function linpack_z_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests ZGBFA and ZGBSL.
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
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  For a complex general band storage matrix:\n' );
  fprintf ( 1, '  ZGBFA factors the matrix;\n' );
  fprintf ( 1, '  ZGBSL solves a factored linear system.\n' );
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
%  Set the values of the right hand side vector B.
%
  [ x, seed ] = c8vec_uniform_01 ( n, seed );

  b(1:n) = a_save(1:n,1:n) * transpose ( x(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The right hand side B is \n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( b(i) ), imag ( b(i) ) );
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
%  Solve the system.
%
  job = 0;
  b = zgbsl ( a, lda, n, ml, mu, ipvt, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)  (%8f  %8f)\n', ...
      real ( b(i) ), imag ( b(i) ), real ( x(i) ), imag ( x(i) ) );
  end

  return
end
