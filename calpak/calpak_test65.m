function calpak_test65 ( )

%*****************************************************************************80
%
%% CALPAK_TEST65 tests YJF_DIF_COMMON.
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
  fhi = 0.0;
  flo = 0.0;
  jhi = 1;
  jlo = 1;
  seed = 123456789;
  yhi = 1970;
  ylo = 1960;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST65\n' );
  fprintf ( 1, '  For Common calendar YJF dates,\n' );
  fprintf ( 1, '  YJF_DIF_COMMON computes the day difference.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YJF1           YJF2      (YJF2 - YJF1)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
 
    [ y1, j1, f1, seed ] = yjf_uniform_common ( ylo, jlo, flo, yhi, jhi, fhi, seed );
    s1 = yjf_to_s_common ( y1, j1, f1 );

    [ y2, j2, f2, seed ] = yjf_uniform_common ( ylo, jlo, flo, yhi, jhi, fhi, seed );
    s2 = yjf_to_s_common ( y2, j2, f2 );

    [ days, ierror ] = yjf_dif_common ( y1, j1, f1, y2, j2, f2 );
 
    fprintf ( 1, '  %15s  %15s  %11.2f\n', s1, s2, days );
 
  end
 
  return
end