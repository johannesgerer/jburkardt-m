function r8mat_norm_fro_test ( )

%*****************************************************************************80
%
%% R8MAT_NORM_FRO_TEST tests R8MAT_NORM_FRO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  a = zeros ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_NORM_FRO_TEST\n' );
  fprintf ( 1, '  R8MAT_NORM_FRO computes a Frobenius norm of an R8MAT;\n' );

  t1 = 0.0;
  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
      t1 = t1 + k * k;
    end
  end

  t1 = sqrt ( t1 );

  r8mat_print ( m, n, a, '  A:' );

  t2 = r8mat_norm_fro ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected norm = %g\n', t1 );
  fprintf ( 1, '  Computed norm = %g\n', t2 );

  return
end