function r8vec_house_column_test ( )

%*****************************************************************************80
%
%% R8VEC_HOUSE_COLUMN_TEST tests R8VEC_HOUSE_COLUMN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  b = 0.0;
  c = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_HOUSE_COLUMN_TEST\n' );
  fprintf ( 1, '  R8VEC_HOUSE_COLUMN returns the compact form of\n' );
  fprintf ( 1, '  a Householder matrix that "packs" a column\n' );
  fprintf ( 1, '  of a matrix.\n' );
%
%  Get a random matrix.
%
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( n, n, b, c, seed );

  r8mat_print ( n, n, a, '  Matrix A:' );

  for k = 1 : n - 1

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Working on column K = %d\n', k );

    v = r8vec_house_column ( n, a(1:n,k), k );

    h = r8mat_house_form ( n, v );

    r8mat_print ( n, n, h, '  Householder matrix H:' );

    ha = h * a;

    r8mat_print ( n, n, ha, '  Product H*A:' );
%
%  If we set A := HA, then we can successively convert A to upper
%  triangular form.
%
    a = ha;

  end

  return
end
