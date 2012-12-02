function subpak_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests AXIS_LIMITS.
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
  xmin = 67.3;
  xmax = 114.7;
  ndivs = 6;

  [ pxmin, pxmax, pxdiv, nticks ] = axis_limits ( xmin, xmax, ndivs );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  AXIS_LIMITS adjusts plot limits to "nicer" values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input XMIN =    %f\n', xmin );
  fprintf ( 1, '  Input XMAX =    %f\n', xmax );
  fprintf ( 1, '  Input NDIVS =   %d\n', ndivs );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output PXMIN =  %f\n', pxmin );
  fprintf ( 1, '  Output PXMAX =  %f\n', pxmax );
  fprintf ( 1, '  Output PXDIV =  %f\n', pxdiv );
  fprintf ( 1, '  Output NTICKS = %d\n', nticks );

  xmin = -26.0;
  xmax = +26.0;
  ndivs = 10;

  [ pxmin, pxmax, pxdiv, nticks ] = axis_limits ( xmin, xmax, ndivs );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input XMIN =    %f\n', xmin );
  fprintf ( 1, '  Input XMAX =    %f\n', xmax );
  fprintf ( 1, '  Input NDIVS =   %d\n', ndivs );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output PXMIN =  %f\n', pxmin );
  fprintf ( 1, '  Output PXMAX =  %f\n', pxmax );
  fprintf ( 1, '  Output PXDIV =  %f\n', pxdiv );
  fprintf ( 1, '  Output NTICKS = %d\n', nticks );

  return
end
