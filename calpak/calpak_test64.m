function calpak_test64 ( )

%*****************************************************************************80
%
%% CALPAK_TEST64 tests YEAR_TO_TYPE_HEBREW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST64\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  YEAR_TO_TYPE_HEBREW determines the type of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  TYPE\n' );
  fprintf ( 1, '\n' );

  for y = 5760 : 5780
    s = y_to_s_hebrew ( y );
    type = year_to_type_hebrew ( y );
    fprintf ( 1, '  %10s  %i2\n', s, type );
  end

  return
end