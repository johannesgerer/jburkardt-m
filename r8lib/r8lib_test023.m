function subpak_test023 ( )

%*****************************************************************************80
%
%% TEST023 tests R8_SIGN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  x_test = [ -1.25, -0.25, 0.0, +0.5, +9.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST023\n' );
  fprintf ( 1, '  R8_SIGN returns the sign of a number.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    x = x_test(test);
    fprintf ( 1, '  %8f  %8f\n', x, r8_sign ( x ) );
  end

  return
end
