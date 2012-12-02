function chrpak_test057 ( )

%*****************************************************************************80
%
%% TEST057 tests OCT_TO_I4 and I4_TO_OCT.
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
  fprintf ( 1, 'TEST057\n' );
  fprintf ( 1, '  OCT_TO_I4, octal->integer.\n' );
  fprintf ( 1, '  I4_TO_OCT, integer->octal\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I4       OCT        I4\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    i4 = i4_test(test);
    oct = i4_to_oct ( i4 );
    j4 = oct_to_i4 ( oct );

    fprintf ( 1, '  %8d  %8s  %8d\n', i4, oct, j4 );

  end

  return
end
