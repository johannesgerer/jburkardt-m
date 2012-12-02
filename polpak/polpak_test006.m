function polpak_test006 ( )

%*****************************************************************************80
%
%% TEST006 tests ATANH2.
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
  fprintf ( 1, 'TEST006\n' );
  fprintf ( 1, '  ATANH2 computes the inverse hyperbolic tangent\n' );
  fprintf ( 1, '    of a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X           ATANH2(X)  TANH(ATANH2(X))\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 9
    x = i / 10.0;
    a = atanh2 ( x );
    x2 = tanh ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
