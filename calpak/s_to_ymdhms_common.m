function [ y, m, d, h, n, second ] = s_to_ymdhms_common ( s, pat )

%*****************************************************************************80
%
%% S_TO_YMDHMS_COMMON converts a string into a Common YMD H:M:S date.
%
%  Discussion:
%
%    The characters in PAT indicate where the data is stored.  A particular
%    letter, such as "Y", indicates, a year field, while the number of "Y"
%    characters indicates the width of the field.
%
%    The codes are:
%
%    'Y' a year field
%    'M' a numeric month field
%    'N' a literal month field
%    'D' a day field
%    'h' an hour field
%    'm' a minute field
%    's' a second field
%
%  Example:
%
%    S                    PAT
%    ------------         ------------
%    '19991031230859'     'YYYYMMDDhhmmss'
%    '10-31-99'           'MM-DD-YY'
%    '10-31-99'           'MM/DD/YY'
%    'Oct 31 1999'        'NNN DD YYYY'
%    '10:30'              'hh:mm'
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
%    Output, integer Y, M, D, HOUR, N, SECOND, the YMDHMS
%    date represented by the string.  Any item not
%    read from the string will have a value of -1.
%
  y = 0;
  m = 0;
  d = 0;
  h = 0;
  n = 0;
  second = 0;

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

         if ( pat(ilo) == 'Y' )
      y = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'M' )
      m = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'N' )
      m = month_name_to_month_common ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'D' )
      d = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'h' )
      h = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'm' )
      n = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 's' )
      second = str2num ( s(ilo:ihi) );
    end

  end

  return
end