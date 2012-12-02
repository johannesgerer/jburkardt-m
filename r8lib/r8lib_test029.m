function subpak_test029 ( )

%*****************************************************************************80
%
%% TEST029 tests R8_WALSH_1D;
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST029\n' );
  fprintf ( 1, '  R8_WALSH_1D evaluates 1D Walsh functions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  W(+2) W(+1) W(0) W(-1) W(-2) W(-3)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 32

    x = i / 4.0;

    wp2 = r8_walsh_1d ( x,  2 );
    wp1 = r8_walsh_1d ( x,  1 );
    w0  = r8_walsh_1d ( x,  0 );
    wm1 = r8_walsh_1d ( x, -1 );
    wm2 = r8_walsh_1d ( x, -2 );
    wm3 = r8_walsh_1d ( x, -3 );

    fprintf ( 1, '  %10f  %4f  %4f  %4f  %4f  %4f  %4f\n', ...
      x, wp2, wp1, w0, wm1, wm2, wm3 );

  end

  return
end
