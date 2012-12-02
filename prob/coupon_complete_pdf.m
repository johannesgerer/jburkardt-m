function pdf = coupon_complete_pdf ( type_num, box_num )

%*****************************************************************************80
%
%% COUPON_COMPLETE_PDF evaluates the Complete Coupon Collection PDF.
%
%  Discussion:
%
%    PDF(TYPE_NUM;BOX_NUM) is the probability that, given an inexhaustible 
%    supply of boxes, inside each of which there is one of TYPE_NUM distinct
%    coupons, which are uniformly distributed among the boxes, that it will 
%    require opening exactly BOX_NUM boxes to achieve at least one of each
%    kind of coupon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Herbert Wilf,
%    Some New Aspects of the Coupon Collector's Problem,
%    SIAM Review,
%    Volume 48, Number 3, September 2006, pages 549-565.
%
%  Parameters:
%
%    Input, integer BOX_NUM, the number of boxes that had to be opened
%    in order to just get at least one of each coupon.
%    0 <= BOX_NUM.  If BOX_NUM < TYPE_NUM, then PDF is surely 0.
%
%    Input, integer TYPE_NUM, the number of distinct coupons.
%    1 <= TYPE_NUM.
%
%    Output, real PDF, the value of the PDF.
%

%
%  Nonsense cases.
%
  if ( box_num < 0 )

    pdf = 0.0;

  elseif ( type_num < 1 )

    pdf = 0.0;
%
%  Degenerate but meaningful case.
%
  elseif ( type_num == 1 )

    if ( box_num == 1 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end
%
%  Easy cases.
%
  elseif ( box_num < type_num )

    pdf = 0.0;
%
%  General case.
%
  else

    factor = 1.0;
    for i = 1 : type_num
      factor = factor * i / type_num;
    end
    for i = type_num+1 : box_num
      factor = factor / type_num;
    end
    
    pdf = factor * stirling2_value ( box_num-1, type_num-1 );

  end

  return
end
