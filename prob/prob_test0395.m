function prob_test0395 ( )

%*****************************************************************************80
%
%% TEST0395 tests COUPON_COMPLETE_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0395\n' );
  fprintf ( 1, '  COUPON_COMPLETE_PDF evaluates the coupon collector''s\n' );
  fprintf ( 1, '  complete collection pdf.\n' );
  fprintf ( 1, '\n' );

  for type_num = 2 : 4

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of coupon types is %d\n', type_num );
    fprintf ( 1, '\n' );
    fprintf ( 1, '   BOX_NUM      PDF             CDF\n' );
    fprintf ( 1, '\n' );
    cdf = 0.0;
    for box_num = 1 : 20
      pdf = coupon_complete_pdf ( type_num, box_num );
      cdf = cdf + pdf;
      fprintf ( 1, '  %8d  %14f  %14f\n', box_num, pdf, cdf );
    end

  end

  return
end
