function calpak_test70 ( )

%*****************************************************************************80
%
%% TEST70 tests YMDF_INC_COMMON, YMDF_NEXT_COMMON, YMDF_PREV_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
  days = 10.25;
  dhi = 1;
  dlo = 1;
  fhi = 0.0;
  flo = 0.0;
  mhi = 1;
  mlo = 1;
  seed = 123456789;
  yhi = 1960;
  ylo = 1970;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST70\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  YMDF_INC_COMMON increments a date by days;\n' );
  fprintf ( 1, '  YMDF_NEXT_COMMON computes the next day,\n' );
  fprintf ( 1, '  YMDF_PREV_COMMON computes the previous day.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF      Tomorrow       Yesterday      +10.25 days\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
 
    [ y1, m1, d1, f1, seed ] = ymdf_uniform_common ( ylo, mlo, dlo, flo, ...
      yhi, mhi, dhi, fhi, seed );

    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );

    [ y2, m2, d2, f2 ] = ymdf_next_common ( y1, m1, d1, f1 );
    s2 = ymdf_to_s_common ( y2, m2, d2, f2 );

    [ y3, m3, d3, f3 ] = ymdf_prev_common ( y1, m1, d1, f1 );
    s3 = ymdf_to_s_common ( y3, m3, d3, f3 );
 
    [ y4, m4, d4, f4 ] = ymdf_inc_common ( y1, m1, d1, f1, days );
    s4 = ymdf_to_s_common ( y4, m4, d4, f4 );

    fprintf ( 1, '  %15s  %15s  %15s  %15s\n', s1, s2, s3, s4 );

  end

  return
end
