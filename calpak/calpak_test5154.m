function calpak_test5154 ( )

%*****************************************************************************80
%
%% CALPAK_TEST5154 tests YEAR_IS_EMBOLISMIC_GREEK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST5154\n' );
  fprintf ( 1, '  For the Greek calendar:\n' );
  fprintf ( 1, '  YEAR_IS_EMBOLISMIC_GREEK determines if a year is\n' );
  fprintf ( 1, '  an embolismic year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Embolismic?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 20
    sy = y_to_s_greek ( y );
    fprintf ( 1, '    %10s  %d\n', sy, year_is_embolismic_greek ( y ) );
  end

  return
end
