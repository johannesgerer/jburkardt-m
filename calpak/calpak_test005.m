function calpak_test005 ( )

%*****************************************************************************80
%
%% CALPAK_TEST005 tests JED_TO_WEEKDAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST005\n' );
  fprintf ( 1, '  JED_TO_WEEKDAY reports the day of the week\n' );
  fprintf ( 1, '  for a Julian Ephemeris Date.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   JED     W  Name\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    jed2 = jed_to_next_noon ( jed1 );

    [ w2, f2 ] = jed_to_weekday ( jed2 );
 
    s2 = weekday_to_name_common ( w2 );

    fprintf ( 1, '  %11.2f  %1i  %s\n', jed2, w2, s2 );

  end

  return
end
