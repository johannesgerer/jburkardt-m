function type = year_to_type_hebrew ( y )

%*****************************************************************************80
%
%% YEAR_TO_TYPE_HEBREW returns the type of a Hebrew year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, pages 332.
%
%  Parameters:
%
%    Input, integer Y, the Hebrew year.
%    Nonpositive years are illegal input.
%
%    Output, integer TYPE, the year type.
%    1, Common, Deficient, 12 months, 353 days;
%    2, Common, Regular, 12 months, 354 days;
%    3, Common, Abundant, 12 months, 355 days;
%    4, Embolismic, Deficient, 13 months, 383 days;
%    5, Embolismic, Regular, 13 months, 384 days;
%    6, Embolismic, Abundant, 13 months, 385 days.
%
  if ( y <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_TYPE_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_TYPE_HEBREW - Fatal error!' );
  end

  jed = new_year_to_jed_hebrew ( y );

  jed2 = new_year_to_jed_hebrew ( y + 1 );

  year_length = round ( jed2 - jed );

       if ( year_length == 353 )
    type = 1;
  elseif ( year_length == 354 )
    type = 2;
  elseif ( year_length == 355 )
    type = 3;
  elseif ( year_length == 383 )
    type = 4;
  elseif ( year_length == 384 )
    type = 5;
  elseif ( year_length == 385 )
    type = 6;
  else
    type = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_TYPE_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Computed an illegal type = %d\n', type );
    error ( 'YEAR_TO_TYPE_HEBREW - Fatal error!' );
  end

  return
end
