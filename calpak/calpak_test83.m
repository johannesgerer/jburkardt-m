function calpak_test83 ( )

%*****************************************************************************80
%
%% CALPAK_TEST83 tests YMDHMS_TO_DECIMAL
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
  dhi = 1;
  dlo = 1;
  hhi = 0;
  hlo = 0;
  mhi = 1;
  mlo = 1;
  nhi = 0;
  nlo = 0;
  shi = 0;
  slo = 0;
  seed = 123456789;
  yhi = 1970;
  ylo = 1960;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST83\n' );
  fprintf ( 1, '  YMDHMS_TO_DECIMAL converts a date to a year and decimal.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDHMS                         Y.F\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : 10
 
    [ y, m, d, h, n, ss, seed ] = ymdhms_uniform_common ( ylo, mlo, dlo, hlo, ...
      nlo, slo, yhi, mhi, dhi, hhi, nhi, shi, seed );

    s = ymdhms_to_s_common ( y, m, d, h, n, ss );

    yf = ymdhms_to_decimal ( y, m, d, h, n, ss );

    fprintf ( 1, '  %20s  %14.4f\n', s, yf );

  end

  return
end