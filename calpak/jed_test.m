function jed = jed_test ( i )

%*****************************************************************************80
%
%% JED_TEST returns some "interesting" JED's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Bonnie Blackburn, Leofranc Holford-Stevens,
%    The Oxford Companion to the Year,
%    Oxford, 1999.
%
%    Frank Parise, editor,
%    The Book of Calendars,
%    Facts on File, Inc, 1982,
%    CE11.K4 / 529.3.
%
%    Edward Reingold, Nachum Dershowitz,
%    Calendrical Calculations, the Millennium Edition,
%    Cambridge, 2002,
%    CE12.R45 / 529.3-dc21
%
%    Edward Richards,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999.
%
%  Parameters:
%
%    Input, integer I, the test date requested.
%
%    Output, real JED, the Julian Ephemeris Date.
%    If I is less than 1, or greater than the number of test dates
%    available, JED is returned as -1.0.
%

%
%  JED Epoch:
%  Beginning of current Scaliger cycle.
%  Monday, Noon, 1 January 4713 BCE/Julian
%
  if ( i == 1 )

    jed = 0.0;
%
%  The day after the JED Epoch.
%  Tuesday, Noon, 2 January 4713 BCE/Julian
%
  elseif ( i == 2 )

    jed = 1.0;
%
%  Archbishop James Ussher's estimate of the date of Creation,
%  (Noon), 23 October 4004 BCE/Julian
%
  elseif ( i == 3 )

    jed = 259258.000;
%
%  Hebrew Epoch.
%  7 October 3761 BCE/Julian
%
  elseif ( i == 4 )

    jed = 347998.5;
%
%  Mayan Long Count Epoch.
%  6 September 3114 BCE/Julian
%  (Reingold and Dershowitz)
%
  elseif ( i == 5 )

    jed = 584282.5;
%
%  Hindu Solar Epoch.
%  Beginning of the Kali Yuga age.
%  18 February 3102 BCE/Julian
%
  elseif ( i == 6 )

    jed = 588465.75;
%
%  Chinese Epoch.
%  8 March 2637 BCE/Julian
%
  elseif ( i == 7 )

    jed = 758325.5;
%
%  Greek Olympiad Epoch
%  9 July 776 BCE/Julian
%
  elseif ( i == 8 )

    jed = 1438178.5;
%
%  Roman Epoch
%  Ab Urbe Condita
%  1 January 753 BCE/Julian
%
  elseif ( i == 9 )

    jed = 1446389.5;
%
%  Egyptian Civil Calendar Epoch.
%  Ascension of Nabonassar to throne of Babylon.
%  26 February 747 BCE/Julian
%
  elseif ( i == 10 )

    jed = 1448637.5;
%
%  Egyptian Lunar Calendar Epoch.
%  (Don't really know where to set this...)
%  Ascension of Nabonassar to throne of Babylon.
%  26 February 747 BCE/Julian
%
  elseif ( i == 11 )

    jed = 1448637.5;
%
%  Macedonian Epoch
%  1 September 312 BCE/Julian
%
  elseif ( i == 12 )

    jed = 1607708.5;
%
%  Syrian Epoch
%  1 October 312 BCE/Julian
%
  elseif ( i == 13 )

    jed = 1607738.5;
%
%  Alexandrian Epoch
%  29 August 23 BCE/Julian
%
  elseif ( i == 14 )

    jed = 1713262.5;
%
%  "1 January, 0 BC"?  MATLAB epoch?
%
  elseif ( i == 15 )

    jed = 1721058.5;
%
%  Julian Epoch MINUS ONE DAY
%  Friday, 31 December 1 BCE/Julian
%
  elseif ( i == 16 )

    jed = 1721423.5;
    jed = jed - 1.0;
%
%  Julian Epoch
%  Saturday, 1 January 1 CE/Julian
%
  elseif ( i == 17 )

    jed = 1721423.5;
%
%  Gregorian Epoch
%  Monday, 3 January 1 CE/Julian
%  Monday, 1 January 1 Gregorian
%
  elseif ( i == 18 )

    jed = 1721425.5;
%
%  RD: Reingold and Dershowitz Epoch
%  Monday, 3 January 1 CE/Julian
%  Monday, 1 January 1 Gregorian
%
  elseif ( i == 19 )

    jed = 1721425.5;
%
%  Ethiopian Epoch
%  29 August 8 CE/Julian
%  (Reingold and Dershowitz)
%
  elseif ( i == 20 )

    jed = 1724220.5;
%
%  Hindu Lunar Epoch, the Vikrama
%  24 March 57 CE/Julian
%  (The actual day and month are not specified by RD)
%  (Reingold and Dershowitz)
%
  elseif ( i == 21 )

    jed = 1741959.5;
%
%  Saka Epoch
%  4 March 79 CE/Julian
%
  elseif ( i == 22 )

    jed = 1749994.5;
%
%  Coptic Epoch
%  29 August 284 CE/Julian
%
  elseif ( i == 23 )

    jed = 1825029.5;
%
%  Zoroastrian Epoch.
%  3 March 388 CE/Julian
%
   elseif ( i == 24 )

     jed = 1862836.5;
%
%  Armenian Epoch
%  11 July 552 CE/Julian
%
  elseif ( i == 25 )

    jed = 1922867.5;
%
%  Fasli Deccan Epoch
%  12 July 590 CE/Julian
%
   elseif ( i == 26 )

     jed = 1936747.5;
%
%  Fasli Soor San Epoch
%  24 May 600 CE/Julian
%
   elseif ( i == 27 )

     jed = 1940351.5;
%
%  Persian Solar Epoch
%  19 March 622 CE/Julian
%
  elseif ( i == 28 )

    jed = 1948320.5;
%
%  Islamic A Epoch
%  Thursday, 15 July 622 CE/Julian
%
  elseif ( i == 29 )

    jed = 1948438.5;
%
%  Islamic B Epoch
%  Friday, 16 July 622 CE/Julian
%
  elseif ( i == 30 )

    jed = 1948439.5;
%
%  Yazdegerd Epoch
%  16 June 632 CE
%
  elseif ( i == 31 )

    jed = 1952062.5;
%
%  Khwarizmian Epoch
%  21 June 632 CE/Julian
%
  elseif ( i == 32 )

    jed = 1952067.5;
%
%  Battle of Hastings.
%  Saturday, 14 October 1066 CE/Julian.
%           (20 October 1066 Gregorian.)
%
  elseif ( i == 33 )

    jed = 2110700.5;
%
%  Jelali Epoch
%  17 March 1078 CE/Julian
%
  elseif ( i == 34 )

    jed = 2114872.5;
%
%  Akbar Epoch
%  9 February 1556 CE/Julian
%  19 February 1556 Gregorian
%
  elseif ( i == 35 )

    jed = 2289425.5;
%
%  Common Era calendar transition:
%  Noon of the last day of Julian calendar usage.
%  Thursday, 04 October 1582 CE/English/Julian
%  Thursday, 14 October 1582 Gregorian
%
  elseif ( i == 36 )

    jed = 2299160.5;
    jed = jed - 0.5;
%
%  Common Era calendar transition:
%  Noon of the first day of Gregorian calendar usage.
%  Friday, 05 October 1582 English/Julian
%  Friday, 15 October 1582 CE/Gregorian
%
  elseif ( i == 37 )

    jed = 2299160.5;
    jed = jed + 0.5;
%
%  A day chosen by Lewis Carroll to test his day-of-the-week algorithm,
%  Wednesday, 4 March 1676 CE/Gregorian
%  Wednesday, 23 February 1676 English/Julian
%
  elseif ( i == 38 )

    jed = 2333269.5;
%
%  English calendar
%  noon of the last day of Julian calendar usage.
%  02 September 1752 English/Julian
%  13 September 1752 CE/Gregorian
%
  elseif ( i == 39 )

    jed = 2361221.5;
    jed = jed - 0.5;
%
%  English calendar,
%  noon of the first day of Gregorian calendar usage.
%  03 September 1752 Julian
%  14 September 1752 CE/English/Gregorian
%
  elseif ( i == 40 )

    jed = 2361221.5;
    jed = jed + 0.5;
%
%  A day chosen by Lewis Carroll to test his day-of-the-week algorithm,
%  Thursday, 18 September 1783 CE/Gregorian
%
  elseif ( i == 41 )

    jed = 2372547.5;
%
%  French Republican Epoch
%  Saturday, 11 September 1792 Julian
%  Saturday, 22 September 1792 CE/Gregorian
%
  elseif ( i == 42 )

    jed = 2375839.5;
%
%  Bahai Epoch.
%  9 March 1844 Julian
%  21 March 1844 CE/Gregorian
%
  elseif ( i == 43 )

    jed = 2394646.5;
%
%  Clive James Lucas test date.
%
  elseif ( i == 44 )

    jed = 2394710.50;
%
%  New York Times "epoch" date,
%  fictitious Volume 1, issue #0,
%  17 September 1851
%  (issue #1 was on 18 September 1851):
%
  elseif ( i == 45 )

    jed = 2397383.50;
%
%  Modified Julian Date Epoch.
%  17 November 1858 CE/Gregorian
%
  elseif ( i == 46 )

    jed = 2400000.5;
%
%  NYT issue 10,000
%  24 September 1883
%
  elseif ( i == 47 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000 - 40000.0 - 88.0;
%
%  Bessel Year Count Epoch.
%  1 January 1900 CE/Gregorian
%
  elseif ( i == 48 )

    jed = 2415020.31352;
%
%  NYT issue 30,000
%  14 March 1940
%
  elseif ( i == 49 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000 - 20000.0 - 88.0;
%
%  NYT issue 40,000
%  ???
%
  elseif ( i == 50 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000 - 10000.0 - 88.0;
%
%  UNIX epoch.
%  1 January 1970 CE/Gregorian.
%
  elseif ( i == 51 )

    jed = 2440587.50;
%
%  NYT issue 44027
%  ???
%
  elseif ( i == 52 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000 - 5973;
%
%  NYT issue 44028
%  ???
%
  elseif ( i == 53 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000 - 5972;
%
%  GPS epoch.
%  6 January 1980 CE/Gregorian
%
  elseif ( i == 54 )

    jed = 2444244.5;
%
%  NYT issue 50,000
%  14 March 1995
%
  elseif ( i == 55 )

    jed_epoch_50000 = 2449790.5;
    jed = jed_epoch_50000;
%
%  25 February 1996
%  A Reingold/Dershowitz test date.
%
  elseif ( i == 56 )

    jed = 2450138.5;
%
%  Y2K day
%  1 January 2000 CE/Gregorian
%
  elseif ( i == 57 )

    jed = 2451544.5;
%
%  Today
%
  elseif ( i == 58 )

    jed = now_to_jed ( );
%
%  End of Current Mayan Great Cycle
%  21 December 2012 CE/Gregorian
%
  elseif ( i == 59 )

    jed = 2456282.5;
%
%  Scaliger cycle repeats.
%  1 January 3266 CE/Gregorian
%
  elseif ( i == 60 )

    jed = 2913943.0;

  else

    jed = -1.0;

  end

  return
end
