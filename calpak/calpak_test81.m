function calpak_test81 ( )

%*****************************************************************************80
%
%% CALPAK_TEST81 tests YMDF_TO_WEEK_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST81\n' );
  fprintf ( 1, '  YMDF_TO_WEEK_COMMON reports week number for a YMDF date.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    JED     YMDF          Week\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end

    [ y1, m1, d1, f1 ] = jed_to_ymdf_common ( jed );
 
    s1 = ymdf_to_s_common ( y1, m1, d1, f1 );
 
    week = ymdf_to_week_common ( y1, m1, d1, f1 );

    fprintf ( 1, '  %11.2f  %20s  %2d\n', jed, s1, week );

  end

  return
end