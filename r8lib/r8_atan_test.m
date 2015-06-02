function r8_atan_test ( )

%*****************************************************************************80
%
%% R8_ATAN_TEST tests R8_ATAN.
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
  ntest = 8;

  xtest(1:8) = [ 1.0, 1.0, 0.0, -1.0, -1.0, -1.0,  0.0,  1.0 ];
  ytest(1:8) = [ 0.0, 1.0, 1.0,  1.0,  0.0, -1.0, -1.0, -1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ATAN_TEST\n' );
  fprintf ( 1, '  R8_ATAN computes the arc-tangent given Y and X;\n' );
  fprintf ( 1, '  ATAN2 is the system version of this routine.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X     Y     ATAN2(Y,X)   R8_ATAN(Y,X)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest
    x = xtest(i);
    y = ytest(i);
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', ...
      x, y, atan2 ( y, x ), r8_atan ( y, x ) );
  end

  return
end

