function calpak_test51535 ( )

%*****************************************************************************80
%
%% CALPAK_TEST51535 tests YEAR_IS_EMBOLISMIC_EG_LUNAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST51535\n' );
  fprintf ( 1, '  For the Egyptian Lunar calendar:\n' );
  fprintf ( 1, '  YEAR_IS_EMBOLISMIC_EG_LUNAR determines if a year is\n' );
  fprintf ( 1, '  an embolismic year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Embolismic?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 25
    s = y_to_s_eg_lunar ( y );
    fprintf ( 1, '  %s  %d\n', s, year_is_embolismic_eg_lunar ( y ) );
  end

  return
end