function linplus_test0196 ( )

%*****************************************************************************80
%
%%  TEST0196 tests R8VEC_TO_R8GE, R8GE_TO_R8VEC.
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
  m = 4;
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0196\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  R8VEC_TO_R8GE converts a real vector to a R8GE matrix.\n' );
  fprintf ( 1, '  R8GE_TO_R8VEC converts a R8GE matrix to a real vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  a = r8ge_indicator ( m, n );

  r8ge_print ( m, n, a, '  The R8GE indicator matrix:' );

  x = r8ge_to_r8vec ( m, n, a );

  k = 0;
  for j = 1 : n
    for i = 1 : m
      k = k + 1;
      fprintf ( 1, '%4d  %4d  %4d  %14f\n', i, j, k, x(k) );
    end
  end

  a = r8vec_to_r8ge ( m, n, x );

  r8ge_print ( m, n, a, '  The recovered R8GE indicator matrix:' );

  return
end
