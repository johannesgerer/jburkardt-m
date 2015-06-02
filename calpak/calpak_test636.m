function calpak_test636 ( )

%*****************************************************************************80
%
%% CALPAK_TEST636 tests YEAR_TO_SCALIGER_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST636\n' );
  fprintf ( 1, '  For a Common year,\n' );
  fprintf ( 1, '  YEAR_TO_SCALIGER_COMMON determines the Scaliger indices.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Julian / Metonic / Indiction\n' );
  fprintf ( 1, '\n' );

  for y = -4713 : -4675

    y2 = y_astronomical_to_common ( y );
    sy = y_to_s_common ( y2 );
    [ c1, c2, c3, r1, r2, r3 ] = year_to_scaliger_common ( y2 );
    fprintf ( 1, '  %10s  %3d  %3d    %3d  %3d    %3d  %3d\n', ...
    sy, c1, r1, c2, r2, c3, r3 );

  end

  return
end