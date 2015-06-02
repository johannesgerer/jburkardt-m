function calpak_test675 ( )

%*****************************************************************************80
%
%% CALPAK_TEST675 tests YJF_TO_YMDF_ENGLISH and YMDF_TO_YJF_ENGLISH.
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
  fprintf ( 1, 'CALPAK_TEST675\n' );
  fprintf ( 1, '  For the English calendar,\n' );
  fprintf ( 1, '  YJF_TO_YMDF_ENGLISH: YJF => YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_YJF_ENGLISH: YMDF => YJF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      JED    YMDF(in)         YJF        YMDF(out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_english ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end

    if ( jed_epoch <= jed )

      [ y1, m1, d1, f1 ] = jed_to_ymdf_english ( jed );
      
      s1 = ymdf_to_s_english ( y1, m1, d1, f1 );

      [ y2, j2, f2 ] = ymdf_to_yjf_english ( y1, m1, d1, f1 );

      s2 = yjf_to_s_english ( y2, j2, f2 );

      [ y3, m3, d3, f3 ] = yjf_to_ymdf_english ( y2, j2, f2 );

      s3 = ymdf_to_s_english ( y3, m3, d3, f3 );

      fprintf ( 1, '  %11.2f  %20s  %20s  %20s\n', jed, s1, s2, s3 );

    end

  end

  return
end
