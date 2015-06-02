function i4_sign_test ( )

%*****************************************************************************80
%
%% I4_SIGN_TEST tests I4_SIGN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2014
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  i4_test = [ -10, -7, 0, 5, 9 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_SIGN_TEST\n' );
  fprintf ( 1, '  I4_SIGN returns the sign of a number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    I4  I4_SIGN(I4)\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
    i4 = i4_test(test);
    s = i4_sign ( i4 );
    fprintf ( 1, '  %3d  %11d\n', i4, s );
  end
 
  return
end
