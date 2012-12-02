function subset_test022 ( )

%*****************************************************************************80
%
%% TEST022 tests DEC_ADD.
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
  fprintf ( 1, 'TEST022\n' );
  fprintf ( 1, '  DEC_ADD adds two decimals.\n' );

  dec_digit = 3;

  atop = 128;
  abot = -1;
  btop = 438;
  bbot = -2;

  [ ctop, cbot ] = dec_add ( atop, abot, btop, bbot, dec_digit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of decimal places is %d\n', dec_digit );
  fprintf ( 1, '\n' );
  string = dec_to_s ( atop, abot );
  fprintf ( 1, '  A = %s\n', string );
  string = dec_to_s ( btop, bbot );
  fprintf ( 1, '  B = %s\n', string );
  string = dec_to_s ( ctop, cbot );
  fprintf ( 1, '  C = %s\n', string );

  return
end
