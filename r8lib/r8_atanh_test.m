function r8_atanh_test ( )

%*****************************************************************************80
%
%% R8_ATANH_TEST tests R8_ATANH.
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
  fprintf ( 1, 'R8_ATANH_TEST\n' );
  fprintf ( 1, '  R8_ATANH computes the inverse hyperbolic tangent\n' );
  fprintf ( 1, '  of a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X        R8_ATANH(X)  TANH(R8_ATANH(X))\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 9
    x = i / 10.0;
    a = r8_atanh ( x );
    x2 = tanh ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
