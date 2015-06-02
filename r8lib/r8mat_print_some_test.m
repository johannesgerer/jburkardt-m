function r8mat_print_some_test ( )

%*****************************************************************************80
%
%% R8MAT_PRINT_SOME_TEST tests R8MAT_PRINT_SOME.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
  m = 6;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_PRINT_SOME_TEST\n' );
  fprintf ( 1, '  R8MAT_PRINT_SOME prints some of an R8MAT.\n' );

  for j = 1 : n
    for i = 1 : m
      a(i,j) = i * 10 + j;
    end
  end

  r8mat_print_some ( m, n, a, 2, 1, 4, 2, '  The R8MAT, rows 2:4, cols 1:2:' );

  return
end
