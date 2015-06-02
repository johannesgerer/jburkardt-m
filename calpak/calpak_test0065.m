function calpak_test0065 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0065 tests JED_TO_YEARCOUNT_BESSEL and JED_TO_YEARCOUNT_JULIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 February 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0065\n' );
  fprintf ( 1, '  JED_TO_YEARCOUNT_BESSEL\n' );
  fprintf ( 1, '  returns a tropical year count based at 1900.\n' );
  fprintf ( 1, '  JED_TO_YEARCOUNT_JULIAN\n' );
  fprintf ( 1, '  returns a Julian year count based at 2000.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     JED      YMDF Common        Bessel Year  Julian Year\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end
 
    [ y, m, d, f ] = jed_to_ymdf_common ( jed );
    s = ymdf_to_s_common ( y, m, d, f );
    bessel = jed_to_yearcount_bessel ( jed );
    julian = jed_to_yearcount_julian ( jed );

    fprintf ( 1, '  %11.2f     %20s  %12.4f%12.4f\n', jed, s, bessel, julian );

  end

  return
end
