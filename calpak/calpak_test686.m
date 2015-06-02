function calpak_test686 ( )

%*****************************************************************************80
%
%% CALPAK_TEST686 tests YJF_TO_YMDF_JULIAN and YMDF_TO_YJF_JULIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST686\n' );
  fprintf ( 1, '  For the Julian calendar,\n' );
  fprintf ( 1, '  YJF_TO_YMDF_JULIAN: YJF => YMDF\n' );
  fprintf ( 1, '  YMDF_TO_YJF_JULIAN: YMDF => YJF\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF(in)         YJF        YMDF(out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_julian ( );

  i = 0;

  while ( 1 )
 
    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y1, m1, d1, f1 ] = jed_to_ymdf_julian ( jed1 );

      s1 = ymdf_to_s_julian ( y1, m1, d1, f1 );

      [ y2, j2, f2 ] = ymdf_to_yjf_julian ( y1, m1, d1, f1 );

      s2 = yjf_to_s_julian ( y2, j2, f2 );

      [ y3, m3, d3, f3 ] = yjf_to_ymdf_julian ( y2, j2, f2 );

      s3 = ymdf_to_s_julian ( y3, m3, d3, f3 );

      fprintf ( 1, '  %10s  %10s  %10s\n', s1, s2, s3 );

    end

  end

  return
end