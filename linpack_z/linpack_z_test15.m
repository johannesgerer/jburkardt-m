function linpack_z_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests ZHPFA and ZHPSL.
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
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix using packed storage (HP),\n' );
  fprintf ( 1, '  ZHPFA factors the matrix.\n' );
  fprintf ( 1, '  ZHPSL solves a linear system.\n' );
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
      [ a(k), seed ] = c8_uniform_01 ( seed );
      a_save(i,j) = a(k);
      a_save(j,i) = conj ( a(k) );
    end

    k = k + 1;
    [ a(k), seed ] = r8_uniform_01 ( seed );
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
%  Set the values of the right hand side vector B.
%
  [ x, seed ] = c8vec_uniform_01 ( n, seed );

  b(1:n) = a_save(1:n,1:n) * transpose ( x(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The right hand side B:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( b(i) ), imag ( b(i) ) );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, info ] = zhpfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZHPFA returned an error flag INFO = %d', info );
    return
  end
%
%  Solve the system.
%
  b = zhpsl ( a, n, ipvt, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( b(i) ), imag ( b(i) ), real ( x(i) ), imag ( x(i) ) );
  end

  return
end
