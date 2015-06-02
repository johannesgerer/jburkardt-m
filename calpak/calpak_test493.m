function calpak_test493 ( )

%*****************************************************************************80
%
%% CALPAK_TEST493 tests THANKSGIVING_US.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST493\n' );
  fprintf ( 1, '  THANKSGIVING_US returns, for a given year of \n' );
  fprintf ( 1, '  the Common calendar, the day and month of \n' );
  fprintf ( 1, '  Thanksgiving (US).\n' );
  fprintf ( 1, '\n' );

  for y = 1995 : 2020

    [ m, d ] = thanksgiving_us ( y );
    s = ymd_to_s_common ( y, m, d );
    fprintf ( 1, '  %s\n', s );

  end

  return
end