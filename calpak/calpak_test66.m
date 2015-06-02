function calpak_%test66 ( )

%*****************************************************************************80
%
%% CALPAK_TEST66 tests YJF_TO_WEEKDAY_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST66\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  YJF_TO_WEEKDAY_COMMON reports day of week for a YJF date.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      JED          YMDF           YJF      W  Name\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0 )
      break
    end

    jed2 = jed_to_next_noon ( jed1 );

    [ y1, m1, d1, f1 ] = jed_to_ymdf_common ( jed2 );

    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );
 
    [ y2, j2, f2 ] = ymdf_to_yjf_common ( y1, m1, d1, f1 );

    s2 = yjf_to_s_common ( y2, j2, f2 );

    w3 = yjf_to_weekday_common ( y2, j2, f2 );
 
    s3 = weekday_to_name_common ( w3 );

    fprintf ( 1, '  %11.2f  %20s  %20s  %2d  %20s\n', jed2, s1, s2, w3, s3 );

  end

  return
end