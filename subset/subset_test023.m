function subset_test023 ( )

%*****************************************************************************80
%
%% TEST023 tests DEC_DIV.
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
  fprintf ( 1, 'TEST023\n' );
  fprintf ( 1, '  DEC_DIV divides two decimals.\n' );

  dec_digit = 3;

  atop = 523;
  abot = -1;
  btop = 134;
  bbot = 2;

  [ ctop, cbot ] = dec_div ( atop, abot, btop, bbot, dec_digit );

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
