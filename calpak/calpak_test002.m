function calpak_test002 ( )

%*****************************************************************************80
%
%% CALPAK_TEST002 tests EASTER_JULIAN and EASTER_JULIAN2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 June 2012
%
%  Author:
%
%    John Burkardt
%
  n_test = 10;
  d_test = [  27,    19,   11,   30,   15,    5,   27,   11,    1,   23 ];
  m_test = [   4,     4,    4,    4,    4,    5,    4,    4,    5,    4 ];
  y_test = [ 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST002\n' );
  fprintf ( 1, '  For the Julian calendar,\n' );
  fprintf ( 1, '  for a given year, compute the day and month of Easter.\n' );
  fprintf ( 1, '  EASTER_JULIAN uses Richard''s algorithm.\n' );
  fprintf ( 1, '  EASTER_JULIAN2 uses Richards''s algorithm.\n' );
 
  for i = 1 : n_test

    y = y_test(i);
    m = m_test(i);
    d = d_test(i);
    f = 0.5;

    fprintf ( 1, '\n' );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  CORRECT (Gregorian): %s\n', s )

    jed = ymdf_to_jed_gregorian ( y, m, d, f );
    [ y, m, d, f ] = jed_to_ymdf_julian ( jed );

    s = ymd_to_s_julian ( y, m, d );
    fprintf ( 1, '  CORRECT (Julian):    %s\n', s )

    [ m, d ] = easter_julian ( y );
    s = ymd_to_s_julian ( y, m, d );
    fprintf ( 1, '  EASTER_JULIAN:       %s\n', s )

    [ m, d ] = easter_julian2 ( y );
    s = ymd_to_s_julian ( y, m, d );
    fprintf ( 1, '  EASTER_JULIAN2:      %s\n', s )

  end

  return
end
