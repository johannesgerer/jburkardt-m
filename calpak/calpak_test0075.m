function calpak_test0075 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0075 tests JED_TO_MJD and MJD_TO_JED.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0075\n' );
  fprintf ( 1, '  For the modified JED:\n' );
  fprintf ( 1, '  JED_TO_MJD: JED -> MJD.\n' );
  fprintf ( 1, '  MJD_TO_JED: MJD -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    JEDMOD                JED (out)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    mjd2 = jed_to_mjd ( jed1 );

    jed3 = mjd_to_jed ( mjd2 );

    fprintf ( 1, '  %11.2f     %11.2f  %11.2f\n', jed1, mjd2, jed3 );

  end

  return
end
