function calendar_nyt_test04 ( )

%*****************************************************************************80
%
%% CALENDAR_NYT_TEST04 compares JED_TO_NYT and JED_TO_NYT_ISSUE_IDEAL.
%
%  Discussion:
%
%    JED_TO_NYT returns the issue number printed on the New York Times. 
%    There were many "mistakes" and "accidents" and "corrections" in this system.
%
%    JED_TO_NYT_ISSUE_IDEAL returns an "ideal" issue number which keeps track
%    of every issue, in a sensible, usable way.
%
%  Volume  Issue   D M         Y
%  ------  -----  -- --------- ----
%       1      1  18 September 1851
%       1     92   3 January   1852
%       2    404   3 January   1853
%       2    416  17 January   1853
%       3    856  15 June      1854
%
%       4   1210   4 August    1855
%       5   1259   1 October   1855
%       5   1491  28 June      1856
%       6   1706   9 March     1857
%       7   2155  17 August    1858
%
%       8   2421  23 June      1859
%       9   2586   4 January   1860
%      10   2897   3 January   1861
%      10   3000   1 May       1861
%      12   3432  23 September 1862
%
%      13   3794  20 November  1863
%      14   4130  19 December  1864
%      14   4230  16 April     1865
%      15   4576  26 May       1866
%      17   5034  13 November  1867
%
%      17   5250  22 July      1868
%      20   6189  22 July      1871
%      47  14499   5 February  1898
%      47  15000   7 February  1898
%      52  16579  24 February  1903
%
%      53  16909  15 March     1904
%      54  17292  29 May       1905
%      55  17561  22 February  1906
%      57  18164  18 October   1907
%      58  18856   9 September 1909
%
%      66  21619   3 April     1917
%      74  24651  22 July      1925
%      89  29827  23 September 1939
%      89  30000  14 March     1940
%      94  31881   8 May       1945
%
%      94  31980  15 August    1945
%     113  38864  20 June      1964
%     114  39317  16 September 1965
%     117  40076  15 October   1967
%     118  40721  21 July      1969
%
%     120  41418  18 June      1971
%     127  44027   9 August    1978
%     128  44028   6 November  1978
%     141  48939  17 April     1992
%     144  50000  14 March     1995
%
%     147  50939   8 October   1997
%     149  51753  31 December  1999
%     149  51254   1 January   2000
%     150  51599  11 December  2000
%     154  53108  28 January   2005
%
%     157  54136  22 November  2007
%     157  54267  01 April     2008
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   04 February 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 52;
  issue_test = [ ...
        1,    92,   404,   416,   856, ...
     1210,  1259,  1491,  1706,  2155, ...
     2421,  2586,  2897,  3000,  3432, ...
     3794,  4130,  4230,  4576,  5034, ...
     5250,  6189, 14499, 15000, 16579, ...
    16909, 17292, 17561, 18164, 18856, ...
    21619, 24651, 29827, 30000, 31881, ...
    31980, 38864, 39317, 40076, 40721, ...
    41418, 44027, 44028, 48939, 50000, ...
    50939, 51753, 51254, 51599, 53108, ...
    54136, 54267 ];
  jed_test = [ ...
   2397383.50, 2397490.50, 2397856.50, 2397870.50, 2398384.50, ... 
   2398799.50, 2398857.50, 2399128.50, 2399382.50, 2399908.50, ...
   2400218.50, 2400413.50, 2400778.50, 2400896.50, 2401406.50, ...
   2401829.50, 2402224.50, 2402342.50, 2402747.50, 2403283.50, ...
   2403535.50, 2404630.50, 2414325.50, 2414327.50, 2416169.50, ...
   2416554.50, 2416994.50, 2417263.50, 2417866.50, 2418558.50, ...
   2421321.50, 2424353.50, 2429529.50, 2429702.50, 2431583.50, ...
   2431682.50, 2438566.50, 2439019.50, 2439778.50, 2440423.50, ...
   2441120.50, 2443729.50, 2443818.50, 2448729.50, 2449790.50, ...
   2450729.50, 2451543.50, 2451544.50, 2451889.50, 2453398.50, ...
   2454426.50, 2454557.50 ];
  volume_test = [ ...
       1,    1,    2,    2,    3, ...
       4,    5,    5,    6,    7, ...
       8,    9,   10,   10,   12, ...
      13,   14,   14,   15,   17, ...
      17,   20,   47,   47,   52, ...
      53,   54,   55,   57,   58, ...
      66,   74,   89,   89,   94, ...
      94,  113,  114,  117,  118, ...
     120,  127,  128,  141,  144, ...
     147,  149,  149,  150,  154, ...
     157,  157 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALENDAR_NYT_TEST04\n' );
  fprintf ( 1, '  For the New York Times issue date:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED -> NYT1 by historical record.\n' );
  fprintf ( 1, '  JED -> NYT2 by "JED_TO_NYT"\n' );
  fprintf ( 1, '  JED -> NYT3 by "JED_TO_NYT_ISSUE_IDEAL"\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       JED                 Date             Volume     Issue     Issue     Issue\n' );
  fprintf ( 1, '                                                     (lookup)  (compute)  (Ideal)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    jed = jed_test(test);

    [ y, m, d, f ] = jed_to_ymdf_common ( jed );
    s = ymdf_to_s_common ( y, m, d, f );

    issue1 = issue_test(test);
    volume1 = volume_test(test);

    [ volume2, issue2 ] = jed_to_nyt ( jed );

    issue3 = jed_to_nyt_issue_ideal ( jed );

    fprintf ( 1, '  %11.2f  %25s  %8d  %8d  %8d  %8d\n', ...
      jed, s, volume1, issue1, issue2, issue3 );

  end

  return
end
