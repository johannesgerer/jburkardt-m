function i4lib_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests I4_SIGN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  x_test = [ -10, -7, 0, 5, 9 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  I4_SIGN returns the sign of a number.\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
    x = x_test(test);
    fprintf ( 1, '  %6d  %6d\n', x, i4_sign ( x ) );
  end
 
  return
end
