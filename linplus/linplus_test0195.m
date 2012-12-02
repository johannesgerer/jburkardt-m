function linplus_test0195 ( )

%*****************************************************************************80
%
%% TEST0195 tests R8VEC_TO_R8GB, R8GB_TO_R8VEC.
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
  fprintf ( 1, 'TEST0195\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8VEC_TO_R8GB converts a real vector to a R8GB matrix.\n' );
  fprintf ( 1, '  R8GB_TO_R8VEC converts a R8GB matrix to a real vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML  = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU  = %d\n', mu );

  a = r8gb_indicator ( m, n, ml, mu );

  r8gb_print ( m, n, ml, mu, a, '  The R8GB indicator matrix:' );

  x = r8gb_to_r8vec ( m, n, ml, mu, a );

  k = 0;
  for j = 1 : n
    for i = 1 : 2*ml+mu+1
      k = k + 1;
      fprintf ( 1, '%4d  %4d  %4d  %14f\n', i, j, k, x(k) );
    end
  end

  a = r8vec_to_r8gb ( m, n, ml, mu, x );

  r8gb_print ( m, n, ml, mu, a, '  The recovered R8GB indicator matrix:' );

  return
end
