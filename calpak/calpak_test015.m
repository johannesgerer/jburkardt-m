function calpak_test015 ( )

%*****************************************************************************80
%
%% CALPAK_TEST015 tests JED_TO_YMDF_COMMON and YMDF_TO_JED_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST015\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_COMMON: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_COMMON: YMDF -> JED\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF               JED (out)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    [ y2, m2, d2, f2 ] = jed_to_ymdf_common ( jed1 );

    s2 = ymdf_to_s_common ( y2, m2, d2, f2 );

    jed3 = ymdf_to_jed_common ( y2, m2, d2, f2 );

    fprintf ( 1, '  %11.2f  %20s  %11.2f\n', jed1, s2, jed3 );

  end

  return
end