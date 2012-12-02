function subpak_test05 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST05 tests AXIS_LIMITS.
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
  test_num = 5;

  test_max = [ 9.0, 4.125, 193.75, 2000.250, 12.0 ];
  test_min = [ 1.0, 1.003, 101.25, 2000.125, -7.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBPAK_TEST05\n' );
  fprintf ( 1, '  AXIS_LIMITS computes "nice" limits for a graph\n' );
  fprintf ( 1, '  that must include a given range.\n' );

  ndivs = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  All tests use NDIVS = %d\n', ndivs );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      XMIN        XMAX       PXMIN       PXMAX       PXDIV    NTICKS\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    xmin = test_min(test);
    xmax = test_max(test);

    [ pxmin, pxmax, pxdiv, nticks ] = axis_limits ( xmin, xmax, ndivs );

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f  %12d\n', ...
      xmin, xmax, pxmin, pxmax, pxdiv, nticks );

  end

  return
end
