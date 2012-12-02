function chrpak_test056 ( )

%*****************************************************************************80
%
%% TEST056 tests I4_TO_NUNARY.
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
  test_num = 3;

  i4_test = [ -5, 0, 7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST056\n' );
  fprintf ( 1, '  I4_TO_NUNARY converts an integer to negative unary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I4    NUNARY\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    i4 = i4_test(test);

    s = i4_to_nunary ( i4 );

    fprintf ( 1, '  %8d  %s\n', i4, s );

  end

  return
end
