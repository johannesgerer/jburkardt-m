function days = month_length_hebrew ( y, m )

%*****************************************************************************80
%
%% MONTH_LENGTH_HEBREW returns the number of days in a Hebrew month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 333.
%
%  Parameters:
%
%    Input, integer Y, M, the year and month number.  Note that
%    some years only had 12 months in them, while others have 13.  If
%    Y only has 12 months, then the length of the 13th month is
%    returned as 0 days.
%
%    Output, integer DAYS, the number of days
%    in the month.
%
  a = [ ...
    30,  30,  30,  30,  30,  30; ...
    29,  29,  30,  29,  29,  30; ...
    29,  30,  30,  29,  30,  30; ...
    29,  29,  29,  29,  29,  29; ...
    30,  30,  30,  30,  30,  30; ...
    29,  29,  29,  30,  30,  30; ...
    30,  30,  30,  29,  29,  30; ...
    29,  29,  29,  30,  30,  29; ...
    30,  30,  30,  29,  29,  29; ...
    29,  29,  29,  30,  30,  30; ...
    30,  30,  30,  29,  29,  29; ...
    29,  29,  29,  30,  30,  30; ...
     0,   0,   0,  29,  29,  29 ]';
%
%  Copy the input
%
  y2 = y;
  m2 = m;
%
%  Check the input.
%
  [ y2, m2, ierror ] = ym_check_hebrew ( y2, m2 );

  if ( ierror ~= 0 )
    days = 0;
    return
  end

  type = year_to_type_hebrew ( y2 );

  if ( type < 1 || 6 < type )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONTH_LENGTH_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Illegal year TYPE = %d\n', type );
    fprintf ( 1, '  Y = %d\n', y2 );
    error ( 'MONTH_LENGTH_HEBREW - Fatal error!' );
  end

  if ( m2 < 1 || 13 < m2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONTH_LENGTH_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Illegal MONTH = %d\n', m2 );
    error ( 'MONTH_LENGTH_HEBREW - Fatal error!' );
  end

  days = a(type,m2);

  return
end
