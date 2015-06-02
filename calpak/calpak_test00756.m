function calpak_test00756 ( )

%*****************************************************************************80
%
%% CALPAK_TEST00756 tests NYT_TO_JED.
%
%  Discussion:
%
%    Data (some not used):
%
%     1705   7 March     1857
%     3407  25 August    1862
%     3794  20 November  1863
%     3804   3 December  1863
%    16579  24 February  1903
%    16909  15 March     1904
%    17251  18 April     1905
%    17561  22 February  1906
%    25320  22 May       1927
%    26243  30 November  1929
%    27538  17 June      1933
%    29033  21 June      1937
%    29807   3 September 1939
%    31545   6 June      1945
%    31972   7 August    1945
%    32984  15 May       1948
%    36074  30 October   1956
%    38910   5 August    1964
%    39342  11 October   1965
%    50939   8 October   1997
%    51599  11 December  2000
%    51874  12 September 2001
%    53108  28 January   2005
%    53715  27 September 2006
%    53960  30 May       2007
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 March 2013
%
%  Author:
%
%    John Burkardt
%
  test_num = 34;

  d_test = [ ...
    18, 17, 21, 19, 22,  6,  7, 24, 15, 29, ...
    22, 18,  9,  3, 22, 23, 14,  8, 15, 20, ...
    16, 15, 21, 18,  9,  6, 17, 14,  8, 31, ...
     1, 11, 28, 22 ];
  issue_test = [ ...
        1,  2155,  2990,  4130,  6189, ...
    14499, 15000, 16579, 16909, 17292, ...
    17561, 18164, 18856, 21619, 24651, ...
    29827, 30000, 31881, 31980, 38864, ...
    39317, 40076, 40721, 41418, 44027, ...
    44028, 48939, 50000, 50939, 51753, ...
    51254, 51599, 53108, 54136 ];
  m_test = [ ...
    9,  8,  4, 12,  7,  2,  2,  2,  3,  5,  ...
    2, 10,  9,  4,  7,  9,  3,  5,  8,  6,  ...
    9, 10,  7,  6,  8, 11,  4,  3, 10, 12,  ...
    1, 12,  1, 11 ];
  volume_test = [ ...
       1,    7,   10,   14,   20,   47,   47,   52,   53,   54, ...
      55,   57,   58,   66,   74,   89,   89,   94,   94,  113, ...
     114,  117,  118,  120,  127,  128,  141,  144,  147,  149, ...
     149,  150,  154,  157 ];
  y_test = [ ...
    1851, 1858, 1861, 1864, 1871, 1898, 1898, 1903, 1904, 1905, ...
    1906, 1907, 1909, 1917, 1925, 1939, 1940, 1945, 1945, 1964, ...
    1965, 1967, 1969, 1971, 1978, 1978, 1992, 1995, 1997, 1999, ...
    2000, 2000, 2005, 2007 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST00756\n' );
  fprintf ( 1, '  For the New York Times issue date:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NYT1 -> JED1 by historical record.\n' );
  fprintf ( 1, '  NYT1 -> JED2 by "NYT_TO_JED"\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Conversions agree between 1905 and 1995.\n' );
  fprintf ( 1, '  but there are problems at 1905 and earlier.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Volume    Issue   =>  JED1        Date1\n' );
  fprintf ( 1, '      Volume    Issue  <=   JED2        Date2\n' );
  fprintf ( 1, '                            JED diff\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    issue1 = issue_test(test);
    volume1 = volume_test(test);

    y1 = y_test(test);
    m1 = m_test(test);
    d1 = d_test(test);
    f1 = 0.0;

    jed1 = ymdf_to_jed_common ( y1, m1, d1, f1 );
    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );
    jed2 = nyt_to_jed ( volume1, issue1 );
    [ y2, m2, d2, f2 ] = jed_to_ymdf_common ( jed2 );
    s2 = ymdf_to_s_common ( y2, m2, d2, f2 );
    [ volume3, issue3 ] = jed_to_nyt ( jed2 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d  %8d  %11.2f  %25s\n', volume1, issue1, jed1, s1 );
    fprintf ( 1, '  %8d  %8d  %11.2f  %25s\n', volume3, issue3, jed2, s2 );
    fprintf ( 1, '                      %11.2f\n', jed1 - jed2 );

  end

  return
end