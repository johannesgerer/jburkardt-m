function calpak_test688 ( )

%*****************************************************************************80
%
%% CALPAK_TEST688 tests YJF_TO_YMDHMS_COMMON and YMDHMS_TO_YJF_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2013
%
%  Author:
%
%    John Burkardt
%
  flo = 0.0;
  fhi = 0.0;
  jlo = 1;
  jhi = 1;
  seed = 123456789;
  ylo = 1960;
  yhi = 1970;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST688\n' );
  fprintf ( 1, '  YJF_TO_YMDHMS_COMMON: YJF => YMDHMS\n' );
  fprintf ( 1, '  YMDHMS_TO_YJF_COMMON: YMDHMS => YJF\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YJF (in)         YMDHMS         YJF(out)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5

    [ y1, j1, f1, seed ] = yjf_uniform_common ( ylo, jlo, flo, yhi, jhi, ...
      fhi, seed );

    ss1 = yjf_to_s_common ( y1, j1, f1 );

    [ y2, m2, d2, h2, n2, s2 ] = yjf_to_ymdhms_common ( y1, j1, f1 );
    ss2 = ymdhms_to_s_common ( y2, m2, d2, h2, n2, s2 );

    [ y3, j3, f3 ] = ymdhms_to_yjf_common ( y2, m2, d2, h2, n2, s2 );
    ss3 = yjf_to_s_common ( y3, j3, f3 );

    fprintf ( 1, '  %15s  %15s  %15s\n', ss1, ss2, ss3 );

  end

  return
end