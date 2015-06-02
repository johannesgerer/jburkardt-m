function r8vec_transpose_print_test ( )

%*****************************************************************************80
%
%% R8VEC_TRANSPOSE_PRINT_TEST tests R8VEC_TRANSPOSE_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2010
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_TRANSPOSE_PRINT_TEST\n' );
  fprintf ( 1, '  R8VEC_TRANSPOSE_PRINT prints an R8VEC "tranposed",\n' );
  fprintf ( 1, '  that is, placing multiple entries on a line.\n' );

  [ x, seed ] = r8vec_uniform_01 ( n, seed );

  r8vec_transpose_print ( n, x, '  The vector X:' );

  return
end
