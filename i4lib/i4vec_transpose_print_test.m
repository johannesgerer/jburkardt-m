function i4vec_transpose_print_test (  )

%*****************************************************************************80
%
%% I4VEC_TRANSPOSE_PRINT_TEST tests I4VEC_TRANSPOSE_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  n = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_TRANSPOSE_PRINT_TEST\n' );
  fprintf ( 1, '  I4VEC_TRANSPOSE_PRINT prints an integer vector\n' );
  fprintf ( 1, '  with 5 entries to a row, and a title.\n' );

  a = i4vec_indicator1 ( n );

  i4vec_print ( n, a, '  Output from I4VEC_PRINT:' );

  i4vec_transpose_print ( n, a, '  My array:  ' );

  return
end
