function r8vec_indicator1_test ( )

%*****************************************************************************80
%
%% R8VEC_INDICATOR1_TEST tests R8VEC_INDICATOR1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_INDICATOR1_TEST\n' );
  fprintf ( 1, '  R8VEC_INDICATOR1 returns a 1-based indicator vector.\n' );

  n = 10;
  a = r8vec_indicator1 ( n );
  r8vec_print ( n, a, '  The indicator1 vector:' );

  return
end
