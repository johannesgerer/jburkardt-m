function calpak_test006 ( )

%*****************************************************************************80
%
%% CALPAK_TEST006 tests JED_TO_YEAR_HEBREW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 July 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST006\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  JED_TO_YEAR_HEBREW returns the year of a given JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     JED      Hebrew Year\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_hebrew ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end
 
    if ( jed_epoch <= jed1 )

      y2 = jed_to_year_hebrew ( jed1 );

      s2 = y_to_s_hebrew ( y2 );

      fprintf ( 1, '  %11.2f     %s\n', jed1, s2 );

    end

  end

  return
end
