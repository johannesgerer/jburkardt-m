function calpak_test67 ( )

%*****************************************************************************80
%
%% CALPAK_TEST67 tests YJF_TO_YMDF_COMMON and YMDF_TO_YJF_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 April 2013
%
%  Author:
%
%    John Burkardt
%
  dlo = 1;
  dhi = 1;
  flo = 0.0;
  fhi = 0.0;
  mlo = 1;
  mhi = 1;
  seed = 123456789;
  ylo = 1960;
  yhi = 1970;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST67\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  YJF_TO_YMDF_COMMON: YJF => YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_YJF_COMMON: YMDF => YJF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF(in)         YJF        YMDF(out)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ y1, m1, d1, f1, seed ] = ymdf_uniform_common ( ylo, mlo, dlo, flo, ...
      yhi, mhi, dhi, fhi, seed );

    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );

    [ y2, j2, f2 ] = ymdf_to_yjf_common ( y1, m1, d1, f1 );

    s2 = yjf_to_s_common ( y2, j2, f2 );

    [ y3, m3, d3, f3 ] = yjf_to_ymdf_common ( y2, j2, f2 );

    s3 = ymdf_to_s_common ( y3, m3, d3, f3 );

    fprintf ( 1, '  %20s  %20s  %20s\n', s1, s2, s3 );

  end

  return
end