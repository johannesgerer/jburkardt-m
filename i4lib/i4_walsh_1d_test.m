function i4_walsh_1d_test ( )

%*****************************************************************************80
%
%% I4_WALSH_1D_TEST tests I4_WALSH_1D;
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_WALSH_1D_TEST\n' );
  fprintf ( 1, '  I4_WALSH_1D evaluates 1D Walsh functions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'X  W(+2) W(+1) W(0) W(-1) W(-2) W(-3)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 32

    x = i / 4.0;

    wp2 = i4_walsh_1d ( x,  2 );
    wp1 = i4_walsh_1d ( x,  1 );
    w0  = i4_walsh_1d ( x,  0 );
    wm1 = i4_walsh_1d ( x, -1 );
    wm2 = i4_walsh_1d ( x, -2 );
    wm3 = i4_walsh_1d ( x, -3 );

    fprintf ( 1, '  %9f  %2d  %2d  %2d  %2d  %2d  %2d\n', ...
      x, wp2, wp1, w0, wm1, wm2, wm3 );

  end

  return
end
