function subset_test024 ( )

%*****************************************************************************80
%
%% TEST024 tests DEC_MUL.
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
  fprintf ( 1, 'TEST024\n' );
  fprintf ( 1, '  DEC_MUL multiplies two decimals.\n' );

  dec_digit = 2;

  atop = 14;
  abot = -4;
  btop = 16;
  bbot = 2;

  [ ctop, cbot ] = dec_mul ( atop, abot, btop, bbot, dec_digit );

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
