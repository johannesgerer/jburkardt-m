function r8vec_indicator0_test ( )

%*****************************************************************************80
%
%% R8VEC_INDICATOR0_TEST tests R8VEC_INDICATOR0.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_INDICATOR0_TEST\n' );
  fprintf ( 1, '  R8VEC_INDICATOR0 returns an indicator vector.\n' );

  n = 10;
  a = r8vec_indicator0 ( n );
  r8vec_print ( n, a, '  The indicator0 vector:' );

  return
end
