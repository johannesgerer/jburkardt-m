function agud_test ( )

%*****************************************************************************80
%
%% AGUD_TEST tests AGUD.
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
  fprintf ( 1, 'AGUD_TEST\n' );
  fprintf ( 1, '  AGUD computes the inverse Gudermannian;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X            GUD(X)     AGUD(GUD(X))\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = 1.0 + i / 5.0;
    g = gud ( x );
    x2 = agud ( g );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, g, x2 );
  end

  return
end
