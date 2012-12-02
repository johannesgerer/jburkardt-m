function geometry_test0685 ( )

%*****************************************************************************80
%
%% TEST0685 tests POLAR_TO_XY and XY_TO_POLAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0685\n' );
  fprintf ( 1, '  POLAR_TO_XY converts (R,Theta) to (X,Y);\n' );
  fprintf ( 1, '  XY_TO_POLAR converts (X,Y) to (R,Theta).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '         X           Y     ===>  R           T   =>      X           Y\n' );
  fprintf ( 1, '\n' );

  b = -1.0;
  c = +1.0;
  seed = 123456789;

  for test = 1 : test_num

    [ xy1(1:2,1), seed ] = r8vec_uniform ( 2, b, c, seed );

    [ r, t ] = xy_to_polar ( xy1 );
    xy2 = polar_to_xy ( r, t );

    fprintf ( 1, '  %9f  %9f  %9f  %9f  %9f  %9f\n', xy1(1:2,1), r, t, xy2(1:2,1) );

  end

  return
end
