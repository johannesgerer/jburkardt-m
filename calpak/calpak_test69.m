function calpak_test69 ( )

%*****************************************************************************80
%
%% CALPAK_TEST69 tests YMDF_DIF_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2013
%
%  Author:
%
%    John Burkardt
%
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
  fprintf ( 1, 'CALPAK_TEST69\n' );
  fprintf ( 1, '  YMDF_DIF_COMMON gets the day difference \n' );
  fprintf ( 1, '  between YMDF dates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF1        YMDF2        (YMDF2 - YMDF1)\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : 10
 
    [ y1, m1, d1, f1, seed ] = ymdf_uniform_common ( ylo, mlo, dlo, flo, ...
      yhi, mhi, dhi, fhi, seed );

    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );

    [ y2, m2, d2, f2, seed ] = ymdf_uniform_common ( ylo, mlo, dlo, flo, ...
      yhi, mhi, dhi, fhi, seed );

    s2 = ymdf_to_s_common ( y2, m2, d2, f2 );

    [ days, ierror ] = ymdf_dif_common ( y1, m1, d1, f1, y2, m2, d2, f2 );

    fprintf ( 1, '  %10s  %10s  %11.2f\n', s1, s2, days );

  end

  return
end
