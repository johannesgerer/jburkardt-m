function variance = coupon_variance ( j, n )

%*****************************************************************************80
%
%% COUPON_VARIANCE returns the variance of the Coupon PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer J, the number of distinct coupons to be collected.
%    J must be between 1 and N.
%
%    Input, integer N, the number of distinct coupons.
%
%    Output, real VARIANCE, the variance of the number of
%    coupons that must be collected in order to just get J distinct kinds.
%
  if ( n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COUPON_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Number of distinct coupons desired must be no more\n' );
    fprintf ( 1, '  than the total number of distinct coupons.\n' );
    error ( 'COUPON_VARIANCE - Fatal error!' );
  end

  variance = 0.0;
  for i = 1 : j
    variance = variance + ( i - 1 ) / ( n - i + 1 )^2;
  end
  variance = variance * n;

  return
end
