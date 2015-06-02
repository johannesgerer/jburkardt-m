function r8_cube_root_test ( )

%*****************************************************************************80
%
%% R8_CUBE_ROOT_TEST tests R8_CUBE_ROOT.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_CUBE_ROOT_TEST\n' );
  fprintf ( 1, '  R8_CUBE_ROOT computes the cube root of an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X               Y               Y^3\n' );
  fprintf ( 1, '\n' );

  a = -10.0;
  b = +10.0;
  seed = 123456789;

  for i = 1 : 10
    [ x1, seed ] = r8_uniform_ab ( a, b, seed );
    y = r8_cube_root ( x1 );
    x2 = y ^ 3;
    fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', x1, y, x2 );
  end

  return
end
