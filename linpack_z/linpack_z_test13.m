function linpack_z_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests ZHIFA and ZHIDI.
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
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian matrix (HI):\n' );
  fprintf ( 1, '  ZHIFA factors the matrix.\n' );
  fprintf ( 1, '  ZHIDI computes the determinant, inverse,\n' );
  fprintf ( 1, '  or inertia.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  for i = 1 : n
    [ a(i,i), seed ] = r8_uniform_01 ( seed );
    for j = i+1 : n
      [ a(i,j), seed ] = c8_uniform_01 ( seed );
      a(j,i) = conj ( a(i,j) );
    end
  end

  a_save(1:n,1:n) = a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
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
  [ a, ipvt, info ] = zhifa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZHIFA returned an error flag INFO = %d', info );
    return
  end
%
%  Get the determinant.
%
  job = 010;
  [ a, det, inert ] = zhidi ( a, lda, n, ipvt, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = %f * 10^%f', det(1), det(2) );
%
%  Get the inertia.
%
  job = 100;
  [ a, det, inert ] = zhidi ( a, lda, n, ipvt, job );

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
  [ a, det, inert ] = zhidi ( a, lda, n, ipvt, job );
%
%  Only the upper triangle is set, so the user must set up the
%  lower triangle:
%
  for i = 1 : n
    a(i,1:i-1) = conj ( transpose ( a(1:i-1,i) ) );
  end

  c(1:n,1:n) = a(1:n,1:n) * a_save(1:n,1:n);

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
