function r4lib_test023 ( )

%*****************************************************************************80
%
%% R4LIB_TEST023 tests R4_SIGN and R4_SIGN3.
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

  r4_test = [ -1.25, -0.25, 0.0, +0.5, +9.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R4LIB_TEST023\n' );
  fprintf ( 1, '  R4_SIGN returns the sign of a number.\n' );
  fprintf ( 1, '  R4_SIGN3 returns the three-way sign of a number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    R4  R4_SIGN(R4)  R4_SIGN3(R4)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    r4 = r4_test(test);
    s1 = r4_sign ( r4 );
    s2 = r4_sign3 ( r4 );
    fprintf ( 1, '  %8f  %8f  %8f\n', r4, s1, s2 );
  end

  return
end
