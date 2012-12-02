function chrpak_test046 ( )

%*****************************************************************************80
%
%% TEST046 tests HEX_TO_I4 and I4_TO_HEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;

  i4_test = [ 21, -32, 1776 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST046\n' );
  fprintf ( 1, '  HEX_TO_I4, hexadecimal->integer.\n' );
  fprintf ( 1, '  I4_TO_HEX, integer->hexadecimal\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I  I4_TO_HEX(I)  HEX_TO_I4(I4_TO_HEX(I))\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    i4 = i4_test(test);
    hex = i4_to_hex ( i4 );
    j4 = hex_to_i4 ( hex );

    fprintf ( 1, '  %8d  %8s  %8d\n', i4, hex, j4 );

  end

  return
end
