function chrpak_test006 ( )

%*****************************************************************************80
%
%% TEST006 tests BINARY_TO_I4 and I4_TO_BINARY.
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
  test_num = 4;

  i4_test = [ 21, -32, 2, 128 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST006\n' );
  fprintf ( 1, '  BINARY_TO_I4 converts a binary to an integer.\n' );
  fprintf ( 1, '  I4_TO_BINARY converts an integer to binary,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4 ==> BINARY ==> I4\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
 
    i4 = i4_test(test);
    s = i4_to_binary ( i4 );
    j4 = binary_to_i4 ( s );

    fprintf ( 1, '  %8d  %8s  %8d\n', i4, s, j4 );
 
  end

  return
end
