function polpak_test0675 ( )

%*****************************************************************************80
%
%% TEST0675 tests R8_ACOSH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0675\n' );
  fprintf ( 1, '  R8_ACOSH computes the inverse hyperbolic cosine\n' );
  fprintf ( 1, '  of a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X        R8_ACOSH(X)    COSH(R8_ACOSH(X))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = 1.0 + i / 5.0;
    a = r8_acosh ( x );
    x2 = cosh ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
