function stroud_test49 ( )

%*****************************************************************************80
%
%% TEST49 tests TVEC_EVEN_BRACKET, TVEC_EVEN_BRACKET2, TVEC_EVEN_BRACKET3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST49\n' );
  fprintf ( 1, '  For evenly spaced angles between THETA1 and THETA2:\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET2.\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET3.\n' );

  theta1 = 30.0E+00;
  theta2 = 90.0E+00;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    THETA1 = %f\n', theta1 );
  fprintf ( 1, '    THETA2 = %f\n', theta2 );

  nt = 4;

  t = tvec_even_bracket ( nt, theta1, theta2 );

  r8vec_print ( nt, t, '  TVEC_EVEN_BRACKET' );

  nt = 5;

  t = tvec_even_bracket2 ( nt, theta1, theta2 );

  r8vec_print ( nt, t, '  TVEC_EVEN_BRACKET2' );

  nt = 3;

  t = tvec_even_bracket3 ( nt, theta1, theta2 );

  r8vec_print ( nt, t, '  TVEC_EVEN_BRACKET3' );

  return
end
