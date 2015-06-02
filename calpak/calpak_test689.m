function calpak_test689 ( )

%*****************************************************************************80
%
%% CALPAK_TEST689 tests YMD_TO_DECIMAL
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
  yhi = 1970;
  ylo = 1960;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST689\n' );
  fprintf ( 1, '  YMD_TO_DECIMAL converts a date to a year and decimal.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMD                            Y.F\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : 10

    [ y, m, d, f, seed ] = ymdf_uniform_common ( ylo, mlo, dlo, flo, yhi, ...
      mhi, dhi, fhi, seed );

    s = ymd_to_s_common ( y, m, d );

    yf = ymd_to_decimal ( y, m, d );

    fprintf ( 1, '  %10s  %14.4f\n', s, yf );

  end

  return
end
