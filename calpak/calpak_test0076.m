function test0076 ( )

%*****************************************************************************80
%
%% TEST0076 tests JED_TO_RD and RD_TO_JED.
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
  fprintf ( 1, 'TEST0076\n' );
  fprintf ( 1, '  For the RD:\n' );
  fprintf ( 1, '  JED_TO_RD: JED -> RD.\n' );
  fprintf ( 1, '  RD_TO_JED: RD -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    RD                JED (out)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    rd2 = jed_to_rd ( jed1 );

    jed3 = rd_to_jed ( rd2 );

    fprintf ( 1, '  %11.2f     %11.2f     %11.2f\n', jed1, rd2, jed3 );

  end

  return
end