function cmp = ymdhms_compare ( y1, m1, d1, h1, n1, s1, y2, m2, d2, h2, n2, s2 )

%*****************************************************************************80
%
%% YMDHMS_COMPARE compares two YMDHMS dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, H1, N1, S1, the first date.
%
%    Input, integer Y2, M2, D2, H2, N2, S2, the second date.
%
%    Output, character CMP:
%    '<' if date 1 precedes date 2;
%    '=' if date 1 equals date 2;
%    '>' if date 1 follows date 2;
%    '?' if one of the dates was illegal.
%
  cmp = '?';
%
%  Make local copies of the input, and then check them.
%  We need local copies because the checking routine can
%  change the input values.
%
  [ y1, m1, d1, h1, n1, s1, ierror ] = ymdhms_check_common ( y1, m1, d1, h1, n1, s1 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMDHMS_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Date #1 is illegal.\n' );
    error ( 'YMDHMS_COMPARE - Fatal error!' );
  end

  [ y2, m2, d2, h2, n2, s2, ierror ] = ymdhms_check_common ( y2, m2, d2, h2, n2, s2 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMDHMS_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Date #2 is illegal.\n' );
    error ( 'YMDHMS_COMPARE - Fatal error!' );
  end
%
%  Compare years...
%
  if ( y1 < y2 )
    cmp = '<';
  elseif ( y1 > y2 )
    cmp = '>';
  else
%
%  ...if necessary, compare months in equal years...
%
    if ( m1 < m2 )
      cmp = '<';
    elseif ( m1 > m2 )
      cmp = '>';
    else
%
%  ...if necessary, compare days in equal months...
%
      if ( d1 < d2 )
        cmp = '<';
      elseif ( d1 > d2 )
        cmp = '>';
      else
%
%  ...if necessary, compare hours in equal days...
%
        if ( h1 < h2 )
          cmp = '<';
        elseif ( h1 > h2 )
          cmp = '>';
        else
%
%  ...if necessary, compare minutes in equal hours...
%
          if ( n1 < n2 )
            cmp = '<';
          elseif ( n1 > n2 )
            cmp = '>';
          else
%
%  ...if necessary, compare seconds in equal minutes...
%
            if ( s1 < s2 )
              cmp = '<';
            elseif ( s1 > s2 )
              cmp = '>';
            else
              cmp = '=';
            end

          end
        end
      end
    end
  end

  return
end