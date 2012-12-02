function linpack_c_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests CHPFA and CHPDI.
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
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix using packed storage (HP),\n' );
  fprintf ( 1, '  CHPFA factors the matrix.\n' );
  fprintf ( 1, '  CHPDI computes the determinant, inverse,\n' );
  fprintf ( 1, '  or inertia.\n' );
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
  [ a, ipvt, info ] = chpfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  CHPFA returned an error flag INFO = %d', info );
    return
  end
%
%  Get the determinant.
%
  job = 010;
  [ a, det, inert ] = chpdi ( a, n, ipvt, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = %f * 10^%f', det(1), det(2) );
%
%  Get the inertia.
%
  job = 100;
  [ a, det, inert ] = chpdi ( a, n, ipvt, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The inertia:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 3
    fprintf ( 1, '  %8d\n', inert(i) );
  end
%
%  Get the inverse.
%
  job = 001;
  [ a, det, inert ] = chpdi ( a, n, ipvt, job );
%
%  Only the upper triangle is set, so the user must set up the
%  lower triangle:
%
  k = 0;
  for j = 1 : n
    for i = 1 : j-1
      k = k + 1;
      b(i,j) = a(k);
      b(j,i) = conj ( a(k) );
    end
    k = k + 1;
    b(j,j) = a(k);
  end

  c(1:n,1:n) = b(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product inv(A) * A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( c(i,j) ), imag ( c(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
