function r8vec_print_test ( )

%*****************************************************************************80
%
%% R8VEC_PRINT_TEST tests R8VEC_PRINT.
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
  n = 4;

  a = [ 123.456, 0.000005, -1.0E+06, 3.14159265 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_PRINT_TEST\n' );
  fprintf ( 1, '  R8VEC_PRINT prints an R8VEC.\n' );

  r8vec_print ( n, a, '  The R8VEC:' );

  return
end
