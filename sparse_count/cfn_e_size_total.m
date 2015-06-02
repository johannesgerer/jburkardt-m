function n = cfn_e_size_total ( m, ell_max )

%*****************************************************************************80
%
%% CFN_E_SIZE_TOTAL: Closed Fully Nested, Exponential Growth.
%
%  Discussion:
%
%    This calculation assumes that an exponential growth rule is being used,
%    that is, that the 1D rules have orders 1, 3, 7, 15, 31, and so on.
%
%    It counts the number of points in all the product rules that compose
%    the sparse grid, and it does not reduce the count in any way to account
%    for repeated points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer ELL_MAX, the sparse grid level.
%
%    Output, integer N, the total number of points in the grids.
%
  n = 0;

  lvec = zeros ( m, 1 );

  ell_min = max ( ell_max + 1 - m, 0 );

  for ell = ell_min : ell_max

    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ lvec, more, h, t ] = comp_next ( ell, m, lvec, more, h, t );

      nvec = cfn_e_nvec_from_lvec ( lvec );
      ell_num = prod ( nvec(1:m) );
      n = n + ell_num;

      if ( ~ more ) 
        break
      end

    end
  end

  return
end

