function r8mat_house_axh_test ( )

%*****************************************************************************80
%
%% R8MAT_HOUSE_AXH_TEST tests R8MAT_HOUSE_AXH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2015
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_HOUSE_AXH_TEST\n' );
  fprintf ( 1, '  R8MAT_HOUSE_AXH multiplies a matrix A times a\n' );
  fprintf ( 1, '  compact Householder matrix.\n' );

  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( n, n, r8_lo, r8_hi, seed );

  r8mat_print ( n, n, a, '  Matrix A:' );
%
%  Request V, the compact form of the Householder matrix H
%  such that H*A packs column 3 of A.
%
  k = 3;
  v = r8vec_house_column ( n, a(1:n,k), k );

  r8vec_print ( n, v, '  Compact vector V so H*A packs column 3:' );

  h = r8mat_house_form ( n, v );

  r8mat_print ( n, n, h, '  Householder matrix H:' );
%
%  Compute A*H.
%
  ah = r8mat_house_axh ( n, a, v );

  r8mat_print ( n, n, ah, '  Indirect product A*H:' );
%
%  Compare with a direct calculation.
%
  ah = a * h;
  r8mat_print ( n, n, ah, '  Direct product A*H:' );
%
%  Verify that H*A packs column 3:
%
  ha = h * a;
  r8mat_print ( n, n, ha, '  H*A should have packed column 3:' );

  return
end
