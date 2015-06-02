function [ h, n, second ] = s_to_hms ( s, pat )

%*****************************************************************************80
%
%% S_TO_HMS converts a string into a H:M:S date.
%
%  Discussion:
%
%    The characters in PAT indicate where the data is stored.  A particular
%    letter, such as "H", indicates, an hour field, while the number of "H"
%    characters indicates the width of the field.
%
%    The codes are:
%
%    'H' or 'h' an hour field
%    'M' or 'm' a minute field
%    'S' or 's' a second field
%
%  Example:
%
%    S                    PAT
%    ------------         ------------
%    '230859'             'hhmmss'
%    '10:30'              'hh:mm'
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
%  Parameters:
%
%    Input, string S, a string containing the data.
%
%    Input, string PAT, describes how the data is stored.
%    PAT must be the same length as S.
%
%    Output, integer H, N, SECOND, the hour, minute and second
%    represented by the string.  Any item not read from the string will
%    have a value of -1.
%
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

         if ( pat(ilo) == 'H' || pat(ilo) == 'h' )
      h = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'M' || pat(ilo) == 'm' )
      n = str2num ( s(ilo:ihi) );
    elseif ( pat(ilo) == 'S' || pat(ilo) == 's' )
      second = str2num ( s(ilo:ihi) );
    end

  end

  return
end