function calpak_test687 ( )

%*****************************************************************************80
%
%% CALPAK_TEST687 tests YJF_TO_YMDF_ROMAN and YMDF_TO_YJF_ROMAN.
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
  fprintf ( 1, 'CALPAK_TEST687\n' );
  fprintf ( 1, '  For the Roman calendar,\n' );
  fprintf ( 1, '  YJF_TO_YMDF_ROMAN: YJF => YMDF\n' );
  fprintf ( 1, '  YMDF_TO_YJF_ROMAN: YMDF => YJF\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF(in)                                YJF\n' );
  fprintf ( 1, '  YMDF(out)\n' );
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

      [ y1, m1, d1, f1 ] = jed_to_ymdf_roman ( jed1 );

      s1 = ymdf_to_s_roman ( y1, m1, d1, f1 );

      [ y2, j2, f2 ] = ymdf_to_yjf_roman ( y1, m1, d1, f1 );

      s2 = yjf_to_s_roman ( y2, j2, f2 );

      [ y3, m3, d3, f3 ] = yjf_to_ymdf_roman ( y2, j2, f2 );

      s3 = ymdf_to_s_roman ( y3, m3, d3, f3 );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  %60s  %10s\n', s1, s2 );
      fprintf ( 1, '  %60s\n', s3 );

    end

  end

  return
end