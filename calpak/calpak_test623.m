function calpak_test623 ( )

%*****************************************************************************80
%
%% CALPAK_TEST623 tests YEAR_TO_EPACT_GREGORIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST623\n' );
  fprintf ( 1, '  For the Gregorian calendar,\n' );
  fprintf ( 1, '  YEAR_TO_EPACT_GREGORIAN determines the epact of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Epact\n' );
  fprintf ( 1, '\n' );

  for y = -2 : 20
    if ( y ~= 0 )
      s = y_to_s_gregorian ( y );
      e = year_to_epact_gregorian ( y );
      fprintf ( 1, '  %10s  %d\n', s, e );
    end
  end

  return
end
