function [ xdk, ddk ] = dif_derivk_table ( nd, xd, dd, k )

%*****************************************************************************80
%
%% DIF_DERIVK_TABLE computes the divided difference table for K-th derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl deBoor,
%    A Practical Guide to Splines,
%    Springer, 2001,
%    ISBN: 0387953663,
%    LC: QA1.A647.v27.
%
%  Parameters:
%
%    Input, integer ND, the size of the input table.
%
%    Input, real XD(ND), the abscissas for the divided
%    difference table.
%
%    Input, real DD(ND), the divided difference table.
%
%    Input, integer K, the index of the derivative.
%    0 <= K
%
%    Input, real XDK(ND-K), the abscissas for the divided
%    difference table for the derivative.
%
%    Output, real DDK(ND-K), the divided difference 
%    table for the derivative.
%
  if ( k < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF_DERIVK_TABLE - Fatal error!\n' );
    fprintf ( 1, '  K < 0.\n' );
    error ( 'DIF_DERIVK_TABLE - Fatal error!' )
  end

  if ( nd <= k )
    ndk = 0;
    xdk = [];
    ydk = [];
    return
  end
%
%  Shift the abscissas to zero.
%
  ndk = nd;

  xd_temp(1:ndk) = xd(1:ndk);
  dd_temp(1:ndk) = dd(1:ndk);

  [ xd_temp, dd_temp ] = dif_shift_zero ( nd, xd_temp, dd_temp );
%
%  Repeatedly differentiate.
%
  for j = 1 : k

    ndk = ndk - 1;

    for i = 1 : ndk
      dd_temp(i) = i * dd_temp(i+1);
    end

  end

  ddk(1:ndk) = dd_temp(1:ndk);
  xdk(1:ndk) = 0.0;

  return
end
