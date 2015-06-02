function r8vec_nint_test ( )

%*****************************************************************************80
%
%% R8VEC_NINT_TEST tests R8VEC_NINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NINT_TEST\n' );
  fprintf ( 1, '  R8VEC_NINT rounds an R8VEC.\n' );

  n = 5;
  x1 = -5.0;
  x2 = +5.0;
  seed = 123456789;
  [ a, seed ] = r8vec_uniform_ab ( n, x1, x2, seed );
  r8vec_print ( n, a, '  Vector A:' );
  a = r8vec_nint ( n, a );
  r8vec_print ( n, a, '  Rounded vector A:' );

  return
end
