function calpak_test007 ( )

%*****************************************************************************80
%
%% CALPAK_TEST007 tests JED_TO_YJF_COMMON and YJF_TO_JED_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 February 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST007\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  JED_TO_YJF_COMMON: JED -> YJF.\n' );
  fprintf ( 1, '  YJF_TO_JED_COMMON: YJF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YJF 	       JED (out)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );
    
    if ( jed1 < 0.0 )
      break
    end

    [ y2, j2, f2 ] = jed_to_yjf_common ( jed1 );

    s2 = yjf_to_s_common ( y2, j2, f2 );

    jed3 = yjf_to_jed_common ( y2, j2, f2 );

    fprintf ( 1, '  %11.2f     %20s     %11.2f\n', jed1, s2, jed3 );

  end

  return
end