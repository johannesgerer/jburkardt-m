function r8_nint_test ( )

%*****************************************************************************80
%
%% R8_NINT_TEST tests R8_NINT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2014
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_NINT_TEST\n' );
  fprintf ( 1, '  R8_NINT produces the nearest integer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      R8_NINT(X)\n' );
  fprintf ( 1, '\n' );

  b = -10.0;
  c = +10.0;

  for test = 1 : test_num
    [ x, seed ] = r8_uniform_ab ( b, c, seed );
    fprintf ( 1, '  %10f  %6d\n', x, r8_nint ( x ) );
  end

  return
end
