function level_weight2 = sgmga_aniso_balance ( alpha_max, dim_num, ...
  level_weight )

%*****************************************************************************80
%
%% SGMGA_ANISO_BALANCE "balances" an anisotropic weight vector.
%
%  Discussion:
%
%    The entries in LEVEL_WEIGHT are essentially arbitrary nonnegative numbers.
%
%    The ratio between two entries indicates their relative importance.
%    For instance,
%
%      LEVEL_WEIGHT(1) / LEVEL_WEIGHT(2) = 10
%
%    means that variable 2 is 10 times more important than variable 1.
%    Here, being 10 times more important means that we will generate 10 levels
%    of sparse grid in direction 2 as we generate 1 level in direction 1.
%
%    Under this interpretation, a ratio of 10 already indicates an extreme
%    imbalanace in the variables, since 10 sparse grid levels in the second
%    variable corresponds roughly to approximating x^1 only, and
%    all of y^1 through y^10.  A ratio higher than this seems unreasonable.
%
%    Therefore, this function tries to take a somewhat arbitrary level weight
%    vector, and produce a "balanced" level weight vector with the properties
%    that the mininum entry is 1 (representing the item of most importance)
%    and the maximum entry is ALPHA_MAX.  A reasonable value of ALPHA_MAX
%    might be 10 or even 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2010
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
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, real ALPHA_MAX, the maximum legal value of
%    LEVEL_WEIGHT, after all entries have been divided by the minimum
%    nonzero entry.  1 <= ALPHA_MAX.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weights.
%    The values must be positive.
%
%    Output, real LEVEL_WEIGHT2(DIM_NUM), the balanced
%    anisotropic weights.  The smallest nonzero entry is 1.0 and
%    no entry is greater than ALPHA_MAX.
%
  if ( alpha_max < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SGMGA_ANISO_BALANCE - Fatal error!\n' );
    fprintf ( 1, '  ALPHA_MAX < 1.0\n' );
    error ( 'SGMGA_ANISO_BALANCE - Fatal error!' );
  end
%
%  Find the smallest nonzero entry.
%
  level_weight_min = r8_huge ( );
  nonzero_num = 0;

  for dim = 1 : dim_num

    if ( 0.0 < level_weight(dim) )
      if ( level_weight(dim) < level_weight_min )
        level_weight_min = level_weight(dim);
        nonzero_num = nonzero_num + 1;
      end
    end

  end

  if ( nonzero_num == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SGMGA_ANISO_BALANCE - Fatal error!\n' );
    fprintf ( 1, '  Could not find a positive entry in LEVEL_WEIGHT.\n' );
    error ( 'SGMGA_ANISO_BALANCE - Fatal error!' );
  end
%
%  Rescale so the smallest nonzero entry is 1.
%
 level_weight2(1:dim_num) = level_weight(1:dim_num) / level_weight_min;
%
%  Set the maximum entry to no more than ALPHA_MAX.
%
  level_weight2(1:dim_num) = min ( alpha_max, level_weight2(1:dim_num) );

  return
end
