function normal_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests R8_NORMAL_01 and R8MAT_NORMAL_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
  m = 100;
  n = 10;
  seed_init = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  R8_NORMAL_01 gets pseudeonormal values one at a time.\n' );
  fprintf ( 1, '  R8MAT_NORMAL_01 computes a matrix of values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For the same seed, the results should be identical,\n' );
  fprintf ( 1, '  but R8MAT_NORMAL_01 might be faster.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed is %d\n', seed_init );

  seed = seed_init;

  a = zeros ( m, n );

  for j = 1 : n
    for i = 1 : m
      [ a(i,j), seed ] = r8_normal_01 ( seed );
    end
  end

  seed = seed_init;
  [ b, seed ] = r8mat_normal_01 ( m, n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       I       J      A(I,J)        B(I,J)\n' );
  fprintf ( 1, '                  (R8_NORMAL_01)  (R8MAT_NORMAL_01)\n' );
  fprintf ( 1, '\n' );

  for k = 0 : 10
    i = floor ( ( k * m + ( 10 - k ) * 1 ) / 10 );
    j = floor ( ( k * n + ( 10 - k ) * 1 ) / 10 );
    fprintf ( 1, '  %6d  %6d  %12f  %12f\n', i, j, a(i,j), b(i,j) );
  end

  return
end
