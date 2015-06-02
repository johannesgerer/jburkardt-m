function blas0_test015 ( )

%*****************************************************************************80
%
%% BLAS0_TEST015 tests R4_SIGN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2014
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;
  x_test = [ -1.25, -0.25, 0.0, +0.5, +9.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS0_TEST015\n' );
  fprintf ( 1, '  R4_SIGN returns the sign of a number.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    x = x_test(test);
    fprintf ( 1, '  %8f  %8f\n', x, r4_sign ( x ) );
  end

  return
end

