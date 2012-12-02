function subset_test002 ( )

%*****************************************************************************80
%
%% TEST002 tests ASM_TRIANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  max_n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST002\n' );
  fprintf ( 1, '  ASM_TRIANGLE returns a row of the alternating sign\n' );
  fprintf ( 1, '  matrix triangle.\n' );
  fprintf ( 1, '\n' );

  for n = 0 : max_n
    a = asm_triangle ( n );
    fprintf ( 1, '  %2d', n );
    for i = 1 : n+1
      fprintf ( 1, '  %8d', a(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
