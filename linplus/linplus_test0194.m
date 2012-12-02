function linplus_test0194 ( )

%*****************************************************************************80
%
%% TEST0194 tests R8VEC_TO_R8CB, R8CB_TO_R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 8;
  ml = 2;
  mu = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0194\n' );
  fprintf ( 1, '  For a compressed banded matrix,\n' );
  fprintf ( 1, '  R8VEC_TO_R8CB converts a real vector to a R8CB matrix.\n' );
  fprintf ( 1, '  R8CB_TO_R8VEC converts a R8CB matrix to a real vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M      = %d\n', m );
  fprintf ( 1, '  Matrix columns N   = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  a = r8cb_indicator ( m, n, ml, mu );

  r8cb_print ( m, n, ml, mu, a, '  The R8CB indicator matrix:' );

  x = r8cb_to_r8vec ( m, n, ml, mu, a );

  k = 0;
  for j = 1 : n
    for i = 1 : ml+mu+1
      k = k + 1;
      fprintf ( 1, '%4d  %4d  %4d  %14f\n', i, j, k, x(k) );
    end
  end

  a = r8vec_to_r8cb ( m, n, ml, mu, x );

  r8cb_print ( m, n, ml, mu, a, '  The recovered R8CB indicator matrix:' );

  return
end
