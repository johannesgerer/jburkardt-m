function polpak_test004 ( )

%*****************************************************************************80
%
%% TEST004 tests ASINH2.
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
  fprintf ( 1, 'TEST004\n' );
  fprintf ( 1, '  ASINH2 computes the inverse hyperbolic sine\n' );
  fprintf ( 1, '  of a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X           ASINH2(X)   SINH(ASINH2(X))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = 1.0 + i / 5.0;
    a = asinh2 ( x );
    x2 = sinh ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
