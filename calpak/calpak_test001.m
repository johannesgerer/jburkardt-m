function test001 ( )

%*****************************************************************************80
%
%% TEST001 tests EASTER_DS, EASTER_EGR, EASTER_EGR2, EASTER_KNUTH, EASTER_STEWART.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
  n_test = 10;
  d_test = [   30,   12,    4,   23,   15,   31,   20,   11,   27,   16 ];
  m_test = [    3,    4,    4,    4,    4,    3,    4,    4,    3,    4 ];
  y_test = [ 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  For the Gregorian calendar,\n' );
  fprintf ( 1, '  for a given year, compute the day and month of Easter.\n' );
  fprintf ( 1, '  EASTER_DS uses Duffett-Smith''s algorithm.\n' );
  fprintf ( 1, '  EASTER_EGR uses Richards''s algorithm.\n' );
  fprintf ( 1, '  EASTER_EGR2 uses Richards''s algorithm 2.\n' );
  fprintf ( 1, '  EASTER_KNUTH uses Knuth''s algorithm.\n' );
  fprintf ( 1, '  EASTER_STEWART uses Stewart''s algorithm.\n' );

  for i = 1 : n_test

    y = y_test(i);
    m = m_test(i);
    d = d_test(i);

    fprintf ( 1, '\n' );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  CORRECT:        %s\n', s );

    [ m, d ] = easter_ds ( y );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  EASTER_DS:      %s\n', s );

    [ m, d ] = easter_egr ( y );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  EASTER_EGR:     %s\n', s );

    [ m, d ] = easter_egr2 ( y );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  EASTER_EGR2:    %s\n', s );

    [ m, d ] = easter_knuth ( y );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  EASTER_KNUTH:   %s\n', s );

    [ m, d ] = easter_stewart ( y );
    s = ymd_to_s_gregorian ( y, m, d );
    fprintf ( 1, '  EASTER_STEWART: %s\n', s );

  end

  return
end
