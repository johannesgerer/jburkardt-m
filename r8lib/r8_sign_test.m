function r8_sign_test ( )

%*****************************************************************************80
%
%% R8_SIGN_TEST tests R8_SIGN.
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

  r8_test = [ -1.25, -0.25, 0.0, +0.5, +9.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_SIGN_TEST\n' );
  fprintf ( 1, '  R8_SIGN returns the sign of an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    R8  R8_SIGN(R8)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    r8 = r8_test(test);
    s = r8_sign ( r8 );
    fprintf ( 1, '  %8f  %8f\n', r8, s );
  end

  return
end
