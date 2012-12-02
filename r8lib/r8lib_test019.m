function subpak_test019 ( )

%*****************************************************************************80
%
%% TEST019 tests R8_POWER_FAST.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST019\n' );
  fprintf ( 1, '  R8_POWER_FAST computes R^P, economizing on\n' );
  fprintf ( 1, '    multiplications.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      R          P       R^P        Mults\n' );
  fprintf ( 1, '\n' );

  for i = -10 : 40

    r = 2.0;
    p = i;
    [ rp, mults ] = r8_power_fast ( r, p );
    fprintf ( 1, '  %12f  %5d  %12f  %5d\n', r, p, rp, mults );

  end

  return
end
