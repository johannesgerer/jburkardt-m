function [ y, m, d ] = s_to_ymd_common ( s, pat )

%*****************************************************************************80
%
%% S_TO_YMD_COMMON converts a string into a Common YMD date.
%
%  Discussion:
%
%    The characters in PAT indicate where the day, month and year data
%    is stored.  A particular letter, such as "Y", indicates, a year
%    field, while the number of "Y" characters indicates the width of
%    the field.
%
%    The codes are:
%
%    'Y' or 'y', a year field
%    'M' or 'm', a numeric month field
%    'N' or 'n', a literal month field
%    'D' or 'd', a day field
%
%  Example:
%
%    S              PAT
%    ------------   ------------
%    '19991031'     'YYYYMMDD'
%    '10-31-99'     'MM-DD-YY'
%    '10-31-99'     'MM/DD/YY'
%    'Oct 31 1999'  'NNN DD YYYY'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string containing the data.
%
%    Input, string PAT, describes how the data is stored.
%    PAT must be the same length as S.
%
%    Output, integer Y, M, D, the YMD date
%    represented by the string.  Any item not read from the string will
%    have a value of -1.
%
  d = 0;
  m = 0;
  y = 0;

  len = min ( length ( s ), length ( pat ) );

  ihi = 0;

  while ( ihi < len )

    ilo = ihi + 1;
    ihi = ilo;

    while ( ihi + 1 <= len )
      if ( pat(ihi+1) ~= pat(ilo) )
        break
      end
      ihi = ihi + 1;
    end

         if ( pat(ilo) == 'Y' || pat(ilo) == 'y' )
      y = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'M' || pat(ilo) == 'm' )
      m = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'N' || pat(ilo) == 'n' )
      m = month_name_to_month_common ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'D' || pat(ilo) == 'd' )
      d = str2num ( s(ilo:ihi) );
    end

  end

  return
end
