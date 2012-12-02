function chrpak_test051 ( )

%*****************************************************************************80
%
%% TEST051 tests I4_LENGTH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 6;

  i4_test = [ 0, 1, -1, 140, -1952, 123456 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST051\n' );
  fprintf ( 1, '  I4_LENGTH computes an integer''s "length".\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I4    Length\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    i4 = i4_test(test);

    j4 = i4_length ( i4_test(test) );

    fprintf ( 1, '  %8d  %8d\n', i4, j );

  end

  return
end
