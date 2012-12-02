function [ volume, issue ] = jed_to_nyt ( jed )

%*****************************************************************************80
%
%% JED_TO_NYT converts a JED to an NYT date.
%
%  Discussion:
%
%    The New York Times began publication with Volume 1, Issue 1 on
%    Thursday, 18 September 1851.
%
%    The Volume number is incremented annually, on 18 September.
%
%    Surprisingly, computing the correct issue number from the date
%    is complicated.  Here are a few of the misadventures:
%
%      Fri,  2 Jan 1852, no issue.
%            6 Jul 1852, no issue
%      Sat,  2 Jul 1853, no issue, would have been 559.
%      Mon,  4 Jul 1853, INCORRECT issue number 560 (559 not used).
%      Tue,  5 Jul 1853, correct issue number 560.
%            6 Jul 1854, issue, but same issue number as 5 Jul 1854.
%      Thu,  5 Jul 1855, issue, but same issue number as 4 Jul 1855 (#1184)
%      Tue, 25 Sep 1855, issue jumps by 2, from 1253 to 1255!
%      Sat, 29 Sep 1856, issue, but same issue number as 28 Sep 1855 (#1258).
%      Fri,  4 Jan 1856, issue, but same issue number as 3 Jan 1856, (#1340).
%      Mon,  7 Jul 1856, issue, but same issue number as 5 Jul 1856, (#1497).
%      Sat,  3 Jan 1857, issue, but same issue number as 2 Jan 1857, (#1651).
%      Sat,  2 Jan 1858, issue, but same issue number as 1 Jan 1858, (#1962).
%      Tue,  6 Jul 1858, issue, but same issue number as 5 Jul 1858, (#2119).
%      Tue,  5 Jul 1859, no issue.
%      Tue,  3 Jan 1860, no issue.
%      Thu,  5 Jul 1860, no issue.
%      Wed,  2 Jan 1861, no issue
%      Sun, 21 Apr 1861, first Sunday issue.  First two Sundays get distinct issue numbers.
%                        Thereafter, a "correction" is made.
%      Fri,  5 Jul 1861, no issue.
%      Thu,  2 Jan 1862, no issue.
%      Sat,  5 Jul 1862, no issue.
%      Fri,  2 Jan 1863, no issue.
%      Sat,  2 Jan 1864, no issue.
%      Tue,  5 Jul 1864, no issue.
%      Wed,  5 Jul 1865, no issue.
%      Tue,  2 Jan 1866, no issue.
%      Wed,  2 Jan 1867, no issue.
%      Sat,  5 Feb 1898, issue 14499.
%      Mon,  7 Feb 1898, issue 15000 (incremented by 501 instead of by 1)
%      Sun, 23 Apr 1905, Sunday paper gets distinct issue number.
%      Wed,  9 Aug 1978, last prestrike issue.  Issue numbers halt.
%      Mon,  6 Nov 1978, first poststrike issue, issue numbers resume.
%      Sat,  1 Jan 2000, issue numbers "corrected" downwards by 500.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anonymous,
%    A Correction; Welcome to 51,254,
%    The New York Times,
%    01 January 2000, Volume 149, Issue 51254.
%
%    James Barron,
%    What's in a Number? 143 Years of News,
%    The New York Times,
%    14 March 1995, Volume 144, Issue 50000.
%
%    The New York Times,
%    Page One, 1896-1996, A Special Commemorative Edition Celebrating the
%    100th Anniversary of the Purchase of the New York Times by Adolph S Ochs,
%    Galahad Books, 1996,
%    ISBN: 0-88365-961-1,
%    LC: D411.P25.
%
%    The New York Times,
%    The Complete First Pages, 1851-2008,
%    Black Dog & Leventhal Publishers, 2008,
%    ISBN13: 978-1-57912-749-7,
%    LC: D351.N53.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer VOLUME, ISSUE, the New York Times
%   volume and issue.
%

%    The "epoch" of the NYT calendar is the mythical date when issue "0"
%    would have been printed, namely, a tad past midnight, 17 September 1851.
%
%    Volume #1, Issue #1 was printed on 18 September 1851.
%
  jed_epoch = ymdf_to_jed_common ( 1851, 9, 18, 0.0 ) - 1;
%
%  We start out by computing the number of elapsed days, which is
%  our initial estimate of the issue number.
%
  issue = jed - jed_epoch;
%
%  If the user has given a JED before the epoch, return now.
%
  if ( issue <= 0 )
    volume = -1;
    return
  end
%
%  For dates on or after issue #1, the volume computation is easy.
%
  [ y, m, d, f ] = jed_to_ymdf_common ( jed );

  volume = y - 1851 + 1;

  if ( ( m == 9 & d < 18 ) | m < 9 )
    volume = volume - 1;
  end
%
%  CORRECTION #1
%  Deal with nonissue on Friday, 2 January 1852;
%
  jed_02_01_1852 = ymdf_to_jed_common ( 1852, 1, 2, 0.0 );

  if ( jed_02_01_1852 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #2
%  Deal with nonissue on Tuesday, 6 July 1852;
%
  jed_07_06_1852 = ymdf_to_jed_common ( 1852, 7, 6, 0.0 );

  if ( jed_07_06_1852 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #3
%  Deal with nonissue on Saturday, 2 July 1853;
%
  jed_07_02_1853 = ymdf_to_jed_common ( 1853, 7, 2, 0.0 );

  if ( jed_07_02_1853 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #4
%  Deal with use of single issue number 873 for both
%  Wednesday, 5 July 1854 and Thursday, 6 July 1854.
%
  jed_07_06_1854 = ymdf_to_jed_common ( 1854, 7, 6, 0.0 );

  if ( jed_07_06_1854 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #5
%  Deal with use of single issue number 1184 for both
%  Wednesday, 4 July 1855 and Thursday, 5 July 1855.
%
  jed_07_05_1855 = ymdf_to_jed_common ( 1855, 7, 5, 0.0 );

  if ( jed_07_05_1855 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #6
%  They skipped one!
%  Issue 1253 = 24 September 1855
%  Issue 1255 = 25 September 1855
%
  jed_25_09_1855 = ymdf_to_jed_common ( 1855, 9, 25, 0.0 );

  if ( jed_25_09_1855 <= jed ) 
    issue = issue + 1;
  end
%
%  CORRECTION #7
%  They "fixedÓ it.
%  Issue 1258 = 28 September 1855
%  Issue 1258 = 29 September 1855
%
  jed_29_09_1855 = ymdf_to_jed_common ( 1855, 9, 29, 0.0 );

  if ( jed_29_09_1855 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #8
%  Deal with use of single issue number 1340 for both
%  Thursday, 3 January 1856 and Friday, 4 January 1856.
%
  jed_04_01_1856 = ymdf_to_jed_common ( 1856, 1, 4, 0.0 );

  if ( jed_04_01_1856 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #8
%  Deal with use of single issue number 1497 for both
%  Saturday, 5 July 1856 and Monday, 7 July 1856.
%
  jed_07_07_1856 = ymdf_to_jed_common ( 1856, 7, 7, 0.0 );

  if ( jed_07_07_1856 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #9
%  Deal with use of single issue number 1651 for both
%  Friday, 2 January 1857 and Saturday, 3 January 1857.
%
  jed_03_01_1857 = ymdf_to_jed_common ( 1857, 1, 3, 0.0 );

  if ( jed_03_01_1857 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #10
%  Deal with use of single issue number 1962 for both
%  Friday, 1 January 1858 and Saturday, 2 January 1858.
%
  jed_02_01_1858 = ymdf_to_jed_common ( 1858, 1, 2, 0.0 );

  if ( jed_02_01_1858 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #11
%  Deal with use of single issue number 2119 for both
%  Monday, 5 July 1858 and Tuesday, 6 July 1858.
%
  jed_06_07_1858 = ymdf_to_jed_common ( 1858, 7, 6, 0.0 );

  if ( jed_06_07_1858 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #12
%  Deal with nonissue on Tuesday, 5 July 1859:
%
  jed_05_07_1859 = ymdf_to_jed_common ( 1859, 7, 5, 0.0 );

  if ( jed_05_07_1859 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #13
%  Deal with nonissue on Tuesday, 3 January 1860:
%
  jed_03_01_1860 = ymdf_to_jed_common ( 1860, 1, 3, 0.0 );

  if ( jed_03_01_1860 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #14
%  Deal with nonissue on Thursday, 5 July 1860:
%
  jed_05_07_1860 = ymdf_to_jed_common ( 1860, 7, 5, 0.0 );

  if ( jed_05_07_1860 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #15
%  Deal with nonissue on Wednesday, 2 January 1861:
%
  jed_02_01_1861 = ymdf_to_jed_common ( 1861, 1, 2, 0.0 );

  if ( jed_02_01_1861 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #16
%  Sunday issue got its own issue number, 21 April 1861.
%
  jed_04_21_1861 = ymdf_to_jed_common ( 1861, 4, 21, 0.0 );

  if ( jed_04_21_1861 <= jed ) 
    issue = issue + 1;
  end
%
%  CORRECTION #17
%  Sunday issue got its own issue number, 28 April 1861.
%
  jed_04_28_1861 = ymdf_to_jed_common ( 1861, 4, 28, 0.0 );

  if ( jed_04_28_1861 <= jed ) 
    issue = issue + 1;
  end
%
%  CORRECTION #18
%  Two Sunday issues retroactively "corrected" back down, 5 May 1861.
%
  jed_05_05_1861 = ymdf_to_jed_common ( 1861, 5, 5, 0.0 );

  if ( jed_05_05_1861 <= jed ) 
    issue = issue - 2;
  end
%
%  CORRECTION #19
%  Deal with nonissue on Friday, 5 July 1861:
%
  jed_05_07_1861 = ymdf_to_jed_common ( 1861, 7, 5, 0.0 );

  if ( jed_05_07_1861 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #20
%  Deal with nonissue on Thursday, 2 January 1862:
%
  jed_02_01_1862 = ymdf_to_jed_common ( 1862, 1, 2, 0.0 );

  if ( jed_02_01_1862 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #21
%  Deal with nonissue on Saturday, 5 July 1862:
%
  jed_05_07_1862 = ymdf_to_jed_common ( 1862, 7, 5, 0.0 );

  if ( jed_05_07_1862 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #22
%  Deal with nonissue on Friday, 2 January 1863:
%
  jed_02_01_1863 = ymdf_to_jed_common ( 1863, 1, 2, 0.0 );

  if ( jed_02_01_1863 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #23
%  Deal with failure of issue increment on Monday, 28 September 1863:
%
  jed_28_09_1863 = ymdf_to_jed_common ( 1863, 9, 28, 0.0 );

  if ( jed_28_09_1863 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #23
%  Deal with double issue increment on Wednesday, 30 September 1863:
%
  jed_30_09_1863 = ymdf_to_jed_common ( 1863, 9, 30, 0.0 );

  if ( jed_30_09_1863 <= jed ) 
    issue = issue + 1;
  end
%
%  CORRECTION #24
%  Deal with nonissue on Saturday, 2 January 1864:
%
  jed_02_01_1864 = ymdf_to_jed_common ( 1864, 1, 2, 0.0 );

  if ( jed_02_01_1864 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #25
%  Deal with nonissue on Tuesday, 5 July 1864:
%
  jed_05_07_1864 = ymdf_to_jed_common ( 1864, 7, 5, 0.0 );

  if ( jed_05_07_1864 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #26
%  Deal with nonissue on Monday, 3 January 1865:
%
  jed_03_01_1865 = ymdf_to_jed_common ( 1865, 1, 3, 0.0 );

  if ( jed_03_01_1865 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #27
%  Deal with nonissue on Wednesday, 5 July 1865:
%
  jed_05_07_1865 = ymdf_to_jed_common ( 1865, 7, 5, 0.0 );

  if ( jed_05_07_1865 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #28
%  Deal with nonissue on Tuesday, 2 January 1866:
%
  jed_02_01_1866 = ymdf_to_jed_common ( 1866, 1, 2, 0.0 );

  if ( jed_02_01_1866 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #29
%  Deal with nonissue on Wednesday, 2 January 1867:
%
  jed_02_01_1867 = ymdf_to_jed_common ( 1867, 1, 2, 0.0 );

  if ( jed_02_01_1867 <= jed ) 
    issue = issue - 1;
  end
%
%  CORRECTION #30
%  Deal with the interval from Thursday, 18 September 1851 to Saturday, 22 April 1905.
%
%  During this period, there were no Sunday issues.  
%
  jed_22_04_1905 = ymdf_to_jed_common ( 1905, 4, 22, 0.0 );
  days = min ( jed, jed_22_04_1905 ) - jed_epoch;
  sundays = floor ( ( days + 3 ) / 7 );
  issue = issue - sundays;
%
%  CORRECTION #31
%  Issues jumped by 500 because of mistake on 7 February 1898.
%
  jed_07_02_1898 = ymdf_to_jed_common ( 1898, 2, 7, 0.0 );
  if ( jed_07_02_1898 <= jed )
    issue = issue + 500;
  end
%
%  CORRECTION #32
%  No issues from 10 August 1978 through 5 November 1978.
%
  jed_10_08_1978 = ymdf_to_jed_common ( 1978, 8, 10, 0.0 );
  jed_05_11_1978 = ymdf_to_jed_common ( 1978, 11, 5, 0.0 );
  if ( jed_10_08_1978 <= jed )
    issue = issue - ( min ( jed_05_11_1978, jed ) - jed_10_08_1978 ) - 1;
  end
%
%  CORRECTION #33
%  Issues decreased by 500 to correct previous mistake, 1 January 2000.
%
  jed_01_01_2000 = ymdf_to_jed_common ( 2000, 1, 1, 0.0 );
  if ( jed_01_01_2000 <= jed )
    issue = issue - 500;
  end
  return
end
