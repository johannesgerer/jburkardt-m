function polpak_test005 ( )

%*****************************************************************************80
%
%% TEST005 tests ATAN4.
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
  ntest = 8;
  xtest(1) = 1.0;
  ytest(1) = 0.0;

  xtest(2) = 1.0;
  ytest(2) = 1.0;

  xtest(3) = 0.0;
  ytest(3) = 1.0;

  xtest(4) = -1.0;
  ytest(4) = 1.0;

  xtest(5) = -1.0;
  ytest(5) = 0.0;

  xtest(6) = - 1.0;
  ytest(6) = - 1.0;

  xtest(7) =   0.0;
  ytest(7) = - 1.0;

  xtest(8) =   1.0;
  ytest(8) = - 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  ATAN4 computes the arc-tangent given Y and X;\n' );
  fprintf ( 1, '  ATAN2 is the system version of this routine.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X             Y          ATAN2(Y,X)   ATAN4(Y,X)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest
    x = xtest(i);
    y = ytest(i);
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', ...
      x, y, atan2 ( y, x ), atan4 ( y, x ) );
  end

  return
end
