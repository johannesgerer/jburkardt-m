function polpak_test002 ( )

%*****************************************************************************80
%
%% TEST002 tests AGUD, GUD.
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
  fprintf ( 1, 'TEST002\n' );
  fprintf ( 1, '  AGUD computes the inverse Gudermannian;\n' );
  fprintf ( 1, '  GUD computes the Gudermannian.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X            GUD(X)     AGUD(GUD(X))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = 1.0 + i / 5.0;
    gamma = gud ( x );
    x2 = agud ( gamma );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, gamma, x2 );
  end

  return
end
