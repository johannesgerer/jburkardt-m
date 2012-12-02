function issue_ideal = jed_to_nyt_issue_ideal ( jed )

%*****************************************************************************80
%
%% JED_TO_NYT_ISSUE_IDEAL determines the ideal issue number for the New York Times.
%
%  Discussion:
%
%    The New York Times began publication with Volume 1, Issue 1 on
%    Thursday, 18 September 1851.
%
%    Each issue was assigned a volume number and an issue number.
%    The issue number did not restart at 1 with each new volume, but
%    continued to increment.
%
%    A new of interruptions, mistakes, and unusual conventions meant that
%    it is actually not easy to determine the issue number from the date;
%    moreover, it's not easy to determine the "real" issue number from
%    the nominal issue number.
%
%    For instance, in the early years, the paper would not publish
%    on a day shortly after New Year's day (usually 02 January, but
%    not always.)  It would similarly not publish on a day shortly after
%    (or before!) July 4th.
%
%    There was no paper published on Sundays until 1861; the first two
%    Sunday papers came out with their own issue numbers; this was
%    "corrected" by the time the third Sunday issue came out, and thereafter
%    the Sunday paper had the same nominal issuse number as the Saturday
%    paper, until 1905.
%
%    There was a truly bizarre accident in 1898 where the issue number
%    was incremented 501 instead of by 1.
%
%    This was matched by a misguided "correction" in which the 01 January 2000
%    issue was decremented by 499 instead of being incremented by 1.
%
%    There was an anomaly in 1978 when a strike shut the paper down;
%    while the paper was shut down, time moved on but the issue number did not.
%
%    Finally, there were a number of accidents in which the issue number
%    was incorrectly assigned for a day or two and then corrected.
%
%    The attempt to compute the nominal issue number from the JED is
%    handled by the function JED_TO_NYT.
%
%    In contrast, what this function does is to try to compute an
%    ideal issue number, in which a perfect librarian has stacked a single
%    copy of each day's New York Times, and numbered them consecutively.
%    Our task is to determine, given a date, what the corresponding
%    ideal issue number is for the paper that was printed on that date,
%    or most recently and before.
%
%    Thus, if JED represents today, then JED_TO_NYT_ISSUE_IDEAL ( JED )
%    would be exactly the number of distinc issues of the New York Times that
%    have been printed.
%
%    The cover of "The Complete First Pages" seems to claim that 
%    JED_TO_NYT_ISSUE_IDEAL ( 01 April 2008 ) is 54,267.
%    However, since that is actually the nominal issue number for that
%    date, this is only "nominally" true and factually false!
%
%
%    Here are a few of the misadventures in the issue numbering scheme.
%    For the purpose of the ideal issue system, the only thing that matters
%    is days on which there was no issue.  We don't care what nominal issue
%    number was printed each day, or how badly it was garbled:
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
%      Sat,  1 Jan 2000, issue numbers "corrected" downwards by 499.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2009
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
%    Output, integer ISSUE_IDEAL, the ideal NYT issue number.
%

%  The "epoch" of the NYT calendar is the mythical date when issue "0"
%  would have been printed, namely, a tad past midnight, 17 September 1851.
%
%  Volume #1, Issue #1 was printed on 18 September 1851.
%
  jed_epoch = ymdf_to_jed_common ( 1851, 9, 18, 0.0 ) - 1;

  if ( jed <= jed_epoch )
    issue_ideal = 0;
    return
  end

  issue_ideal = jed - jed_epoch;
%
%  CORRECTION #1
%  Deal with nonissue on Friday, 2 January 1852;
%
  jed_02_01_1852 = ymdf_to_jed_common ( 1852, 1, 2, 0.0 );

  if ( jed_02_01_1852 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #2
%  Deal with nonissue on Tuesday, 6 July 1852;
%
  jed_07_06_1852 = ymdf_to_jed_common ( 1852, 7, 6, 0.0 );

  if ( jed_07_06_1852 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #3
%  Deal with nonissue on Saturday, 2 July 1853;
%
  jed_07_02_1853 = ymdf_to_jed_common ( 1853, 7, 2, 0.0 );

  if ( jed_07_02_1853 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #12
%  Deal with nonissue on Tuesday, 5 July 1859:
%
  jed_05_07_1859 = ymdf_to_jed_common ( 1859, 7, 5, 0.0 );

  if ( jed_05_07_1859 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #13
%  Deal with nonissue on Tuesday, 3 January 1860:
%
  jed_03_01_1860 = ymdf_to_jed_common ( 1860, 1, 3, 0.0 );

  if ( jed_03_01_1860 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #14
%  Deal with nonissue on Thursday, 5 July 1860:
%
  jed_05_07_1860 = ymdf_to_jed_common ( 1860, 7, 5, 0.0 );

  if ( jed_05_07_1860 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #15
%  Deal with nonissue on Wednesday, 2 January 1861:
%
  jed_02_01_1861 = ymdf_to_jed_common ( 1861, 1, 2, 0.0 );

  if ( jed_02_01_1861 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #19
%  Deal with nonissue on Friday, 5 July 1861:
%
  jed_05_07_1861 = ymdf_to_jed_common ( 1861, 7, 5, 0.0 );

  if ( jed_05_07_1861 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #20
%  Deal with nonissue on Thursday, 2 January 1862:
%
  jed_02_01_1862 = ymdf_to_jed_common ( 1862, 1, 2, 0.0 );

  if ( jed_02_01_1862 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #21
%  Deal with nonissue on Saturday, 5 July 1862:
%
  jed_05_07_1862 = ymdf_to_jed_common ( 1862, 7, 5, 0.0 );

  if ( jed_05_07_1862 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #22
%  Deal with nonissue on Friday, 2 January 1863:
%
  jed_02_01_1863 = ymdf_to_jed_common ( 1863, 1, 2, 0.0 );

  if ( jed_02_01_1863 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #24
%  Deal with nonissue on Saturday, 2 January 1864:
%
  jed_02_01_1864 = ymdf_to_jed_common ( 1864, 1, 2, 0.0 );

  if ( jed_02_01_1864 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #25
%  Deal with nonissue on Tuesday, 5 July 1864:
%
  jed_05_07_1864 = ymdf_to_jed_common ( 1864, 7, 5, 0.0 );

  if ( jed_05_07_1864 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #26
%  Deal with nonissue on Monday, 3 January 1865:
%
  jed_03_01_1865 = ymdf_to_jed_common ( 1865, 1, 3, 0.0 );

  if ( jed_03_01_1865 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #27
%  Deal with nonissue on Wednesday, 5 July 1865:
%
  jed_05_07_1865 = ymdf_to_jed_common ( 1865, 7, 5, 0.0 );

  if ( jed_05_07_1865 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #28
%  Deal with nonissue on Tuesday, 2 January 1866:
%
  jed_02_01_1866 = ymdf_to_jed_common ( 1866, 1, 2, 0.0 );

  if ( jed_02_01_1866 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #29
%  Deal with nonissue on Wednesday, 2 January 1867:
%
  jed_02_01_1867 = ymdf_to_jed_common ( 1867, 1, 2, 0.0 );

  if ( jed_02_01_1867 <= jed ) 
    issue_ideal = issue_ideal - 1;
  end
%
%  CORRECTION #30
%  Deal with the interval from Thursday, 18 September 1851 to Saturday, 20 April 1861.
%  During this period, there were no Sunday issues.  
%
  jed_20_04_1861 = ymdf_to_jed_common ( 1861, 4, 20, 0.0 );
  days = min ( jed, jed_20_04_1861 ) - jed_epoch;
  sundays = floor ( ( days + 3 ) / 7 );
  issue_ideal = issue_ideal - sundays;
%
%  CORRECTION #32
%  No issues from 10 August 1978 through 5 November 1978.
%
  jed_10_08_1978 = ymdf_to_jed_common ( 1978, 8, 10, 0.0 );
  jed_05_11_1978 = ymdf_to_jed_common ( 1978, 11, 5, 0.0 );
  if ( jed_10_08_1978 <= jed )
    issue_ideal = issue_ideal - ( min ( jed_05_11_1978, jed ) - jed_10_08_1978 ) - 1;
  end

  return
end
