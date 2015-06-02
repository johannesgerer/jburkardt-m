function calpak_test445 ( )

%*****************************************************************************80
%
%% CALPAK_TEST445 tests MOTHERS_DAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST445\n' );
  fprintf ( 1, '  For a given year of the Common calendar,\n' );
  fprintf ( 1, '  compute the day and month of Mother''s Day (US).\n' );
  fprintf ( 1, '\n' );

  for y = 1995 : 2010

    [ m, d ] = mothers_day ( y );
    s = ymd_to_s_common ( y, m, d );
    fprintf ( 1, '  %s\n', s );

  end

  return
end
