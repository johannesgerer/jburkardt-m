function r8_asinh_test ( )

%*****************************************************************************80
%
%% R8_ASINH_TEST tests ASINH.
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
  fprintf ( 1, 'R8_ASINH_TEST\n' );
  fprintf ( 1, '  R8_ASINH computes the inverse hyperbolic sine\n' );
  fprintf ( 1, '  of a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X           R8_ASINH(X)   SINH(R8_SINH(X))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = 1.0 + i / 5.0;
    a = r8_asinh ( x );
    x2 = sinh ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
