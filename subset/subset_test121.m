function test121 ( )

%*****************************************************************************80
%
%% TEST121 tests RAT_MUL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST121\n' );
  fprintf ( 1, '  RAT_MUL multiplies two rationals.\n' );

  atop = 3;
  abot = 4;
  btop = 10;
  bbot = 7;

  [ ctop, cbot ] = rat_mul ( atop, abot, btop, bbot );

  fprintf ( 1, '\n' );
  s = rat_to_s_left ( atop, abot );
  fprintf ( 1, '  A = %s\n', s );
  s = rat_to_s_left ( btop, bbot );
  fprintf ( 1, '  B = %s\n', s );
  s = rat_to_s_left ( ctop, cbot );
  fprintf ( 1, '  C = A * B = %s\n', s );

  return
end
