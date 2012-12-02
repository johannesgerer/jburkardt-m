function chrpak_test022 ( )

%*****************************************************************************80
%
%% TEST022 tests I4_TO_HEX_DIGIT and HEX_DIGIT_TO_I4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2009.
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST022\n' );
  fprintf ( 1, '  I4_TO_HEX_DIGIT: I4 -> hexadecimal digit\n' );
  fprintf ( 1, '  HEX_DIGIT_TO_I4: hexadecimal digit -> I4.\n' );
  fprintf ( 1, '\n' );
 
  for i = -2 : 11
    ch = i4_to_hex_digit ( i );
    i2 = hex_digit_to_i4 ( ch );
    fprintf ( 1, '  %8d  "%c"  %8d\n', i, ch, i2 );
  end
 
  return
end
