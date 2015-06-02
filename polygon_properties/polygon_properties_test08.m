function polygon_properties_test08 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST08 tests POLYGON_INRAD_DATA, POLYGON_OUTRAD_DATA, POLYGON_SIDE_DATA;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST08\n' );
  fprintf ( 1, '  For a REGULAR polygon:\n' );
  fprintf ( 1, '  the inradius, outradius and side are related.\n' );
  fprintf ( 1, '  POLYGON_INRAD_DATA uses the inradius;\n' );
  fprintf ( 1, '  POLYGON_OUTRAD_DATA uses the inradius;\n' );
  fprintf ( 1, '  POLYGON_SIDE_DATA uses the inradius;\n' );

  for n = 3 : 5

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of polygonal sides = %d\n', n );

    side = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Assuming SIDE = %g\n', side );
    [ area, radin, radout ] = polygon_side_data ( n, side );
    fprintf ( 1, '    AREA =   %g\n', area );
    fprintf ( 1, '    RADIN =  %g\n', radin );
    fprintf ( 1, '    RADOUT = %g\n', radout );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Assuming RADIN = %g\n', radin );
    [ area, radout, side ] = polygon_inrad_data ( n, radin );
    fprintf ( 1, '    AREA =   %g\n', area );
    fprintf ( 1, '    RADOUT = %g\n', radout );
    fprintf ( 1, '    SIDE =   %g\n', side );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Assuming RADOUT = %g\n', radout );
    [ area, radin, side ] = polygon_outrad_data ( n, radout );
    fprintf ( 1, '    AREA =   %g\n', area );
    fprintf ( 1, '    RADIN =  %g\n', radin );
    fprintf ( 1, '    SIDE =   %g\n', side );

  end

  return
end
