function linpack_c_test34 ( )

%*****************************************************************************80
%
%% TEST34 tests CSVDC.
%
%  Discussion:
%
%    CSVDC computes the singular value decomposition:
%
%      A = U * S * conjg-transpose ( V )
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
  m = 4;
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST34\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  general storage matrix,\n' );
  fprintf ( 1, '  CSVDC computes the singular value decomposition:\n' );
  fprintf ( 1, '    A = U * S * V^H\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
%
%  Set A.
%
  seed = 123456789;

  [ a, seed ] = c4mat_uniform_01 ( m, n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Decompose the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Decompose the matrix.\n' );

  job = 11;
  lda = m;
  ldu = m;
  ldv = n;

  [ s, e, u, v, info ] = csvdc ( a, lda, m, n, ldu, ldv, job );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Warning:\n' );
    fprintf ( 1, '  CSVDC returned nonzero INFO = %d\n', info );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Singular values:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : min ( m, n )
    fprintf ( 1, '  %4d  (%8f  %8f)\n', i, real ( s(i) ), imag ( s(i) ) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Left Singular Vector Matrix U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m
    for j = 1 : m
      fprintf ( 1, '  (%8f  %8f)', real ( u(i,j) ), imag ( u(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Right Singular Vector Matrix V:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( v(i,j) ), imag ( v(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  sigma(1:m,1:n) = 0.0;
  for i = 1 : min ( m, n )
    sigma(i,i) = s(i);
  end

  a(1:m,1:n) = u(1:m,1:m) * ( sigma(1:m,1:n) * v(1:n,1:n)' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product U * S * V^H (should equal A):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

