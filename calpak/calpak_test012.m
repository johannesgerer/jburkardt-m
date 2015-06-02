function calpak_test012 ( )

%*****************************************************************************80
%
%% CALPAK_TEST012 tests JED_TO_YJF_ROMAN and YJF_TO_JED_ROMAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST012\n' );
  fprintf ( 1, '  For the Roman calendar:\n' );
  fprintf ( 1, '  JED_TO_YJF_ROMAN: JED -> YJF.\n' );
  fprintf ( 1, '  YJF_TO_JED_ROMAN: YJF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YJF                JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_roman ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );
 
    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y2, j2, f2 ] = jed_to_yjf_roman ( jed1 );

      s2 = yjf_to_s_roman ( y2, j2, f2 );

      jed3 = yjf_to_jed_roman ( y2, j2, f2 );

      fprintf ( 1, '  %11.2f  %20s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end
