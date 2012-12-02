function subpak_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests TVEC_EVEN_BRACKET, TVEC_EVEN_BRACKET2, and TVEC_EVEN_BRACKET3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  For evenly spaced angles between THETA1 and THETA2:\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET2.\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET3.\n' );
  fprintf ( 1, '\n' );

  nt = 4;
  theta1 = 30.0;
  theta2 = 90.0;

  t = tvec_even_bracket ( nt, theta1, theta2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '    THETA1 = %f\n', theta1 );
  fprintf ( 1, '    THETA2 = %f\n', theta2 );
  fprintf ( 1, '\n' );
  for i = 1 : nt
    fprintf ( 1, '  %f\n', t(i) );
  end

  nt = 5;

  t = tvec_even_bracket2 ( nt, theta1, theta2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TVEC_EVEN_BRACKET2\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '    THETA1 = %f\n', theta1 );
  fprintf ( 1, '    THETA2 = %f\n', theta2 );
  fprintf ( 1, '\n' );
  for i = 1 : nt
    fprintf ( 1, '  %f\n', t(i) );
  end

  nt = 3;

  t = tvec_even_bracket3 ( nt, theta1, theta2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TVEC_EVEN_BRACKET3\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '    THETA1 = %f\n', theta1 );
  fprintf ( 1, '    THETA2 = %f\n', theta2 );
  fprintf ( 1, '\n' );
  for i = 1 : nt
    fprintf ( 1, '  %f\n', t(i) );
  end

  return
end
