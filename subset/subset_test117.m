function subset_test117 ( )

%*****************************************************************************80
%
%% TEST117 tests RAT_ADD.
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
  fprintf ( 1, 'TEST117\n' );
  fprintf ( 1, '  RAT_ADD adds two rationals.\n' );

  atop = 3;
  abot = 4;
  btop = 10;
  bbot = 7;

  [ ctop, cbot ] = rat_add ( atop, abot, btop, bbot );

  fprintf ( 1, '\n' );
  s = rat_to_s_left ( atop, abot );
  fprintf ( 1, '  A = %s\n', s );
  s = rat_to_s_left ( btop, bbot );
  fprintf ( 1, '  B = %s\n', s );
  s = rat_to_s_left ( ctop, cbot );
  fprintf ( 1, '  C = A + B = %s\n', s );

  return
end
