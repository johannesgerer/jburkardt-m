function test0295 ( )

%*****************************************************************************80
%
%% TEST0295 tests R8_WRAP;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2011
%
%  Author:
%
%    John Burkardt
%
  a = - 2.0;
  b = 12.0;
  rhi = 6.5;
  rlo = 3.0;
  seed = 123456789;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0295\n' );
  fprintf ( 1, '  R8_WRAP "wraps" an R8 to lie within an interval:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrapping interval is %f, %f\n', rlo, rhi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      R      R8_WRAP ( R )\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    [ r, seed ] = r8_uniform_ab ( a, b, seed );
    r2 = r8_wrap ( r, rlo, rhi );
    fprintf ( 1, '  %14g  %14g\n', r, r2 );
  end

  return
end
