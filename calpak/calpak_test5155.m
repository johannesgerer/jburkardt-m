function calpak_test5155 ( )

%*****************************************************************************80
%
%% CALPAK_TEST5155 tests YEAR_IS_EMBOLISMIC_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST5155\n' );
  fprintf ( 1, '  For the Hebrew calendar:\n' );
  fprintf ( 1, '  YEAR_IS_EMBOLISMIC_HEBREW determines if a Hebrew year is\n' );
  fprintf ( 1, '  an embolismic year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Embolismic?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 20
    sy = y_to_s_hebrew ( y );
    fprintf ( 1, '    %10s  %d\n', sy, year_is_embolismic_hebrew ( y ) );
  end

  return
end
