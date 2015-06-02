function calpak_test0006 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0006 tests JED_TO_SS_UNIX and SS_TO_JED_UNIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0006\n' );
  fprintf ( 1, '  For the UNIX SS calendar:\n' );
  fprintf ( 1, '  JED_TO_SS_UNIX: JED -> SS.\n' );
  fprintf ( 1, '  SS_TO_JED_UNIX: SS -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)                  SS           JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_unix ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 ) 
      break
    end

    if ( jed_epoch <= jed1 )

      ss2 = jed_to_ss_unix ( jed1 );

      jed3 = ss_to_jed_unix ( ss2 );

      fprintf ( 1, '  %11.2f     %20.2f  %11.2f\n', jed1, ss2, jed3 );

    end

  end

  return
end