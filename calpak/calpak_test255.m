function calpak_test255 ( )

%*****************************************************************************80
%
%% CALPAK_TEST255 tests JED_TO_YMDF_ROMAN and YMDF_TO_JED_ROMAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 March 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST255\n' );
  fprintf ( 1, '  For the Roman calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_ROMAN: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_ROMAN: YMDF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF                JED (out)\n' );
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

      [ y2, m2, d2, f2 ] = jed_to_ymdf_roman ( jed1 );

      s2 = ymdf_to_s_roman ( y2, m2, d2, f2 );
 
      jed3 = ymdf_to_jed_roman ( y2, m2, d2, f2 );

      fprintf ( 1, '  %11.2f  %45s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end
