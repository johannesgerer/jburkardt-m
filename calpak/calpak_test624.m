function calpak_test624 ( )

%*****************************************************************************80
%
%% CALPAK_TEST624 tests YEAR_TO_EPACT_JULIAN.
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
  fprintf ( 1, 'CALPAK_TEST624\n' );
  fprintf ( 1, '  For the Julian calendar,\n' );
  fprintf ( 1, '  YEAR_TO_EPACT_JULIAN determines the epact of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Epact\n' );
  fprintf ( 1, '\n' );

  for y = -2 : 20
    if ( y ~= 0 )
      s = y_to_s_julian ( y );
      e = year_to_epact_julian ( y );
      fprintf ( 1, '  %10s  %d\n', s, e );
    end
  end

  return
end
