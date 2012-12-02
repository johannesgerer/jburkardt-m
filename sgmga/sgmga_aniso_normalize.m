function level_weight = sgmga_aniso_normalize ( option, dim_num, level_weight )

%*****************************************************************************80
%
%% SGMGA_ANISO_NORMALIZE normalizes the SGMGA anisotropic weight vector.
%
%  Discussion:
%
%    It is convenient for the user to initialize the anisotropic weight
%    vector with any set of positive values.  These values are to be used
%    as coefficients of the 1D levels, to evaluate an expression which 
%    determines which 1D levels will be included in a given rule.
%
%    This means that a relatively LARGE coefficient forces the corresponding 
%    level to be relatively SMALL.  This is perhaps the opposite of what
%    a user might expect.  If a user wishes to use an importance vector,
%    so that a relatively large importance should correspond to more levels,
%    and hence more points, in that dimension, then the function
%    SGMGA_IMPORTANCE_TO_ANISO should be called first!
%
%    Since the weights only represent the relative importance of the
%    components, they may be multiplied by any (positive) scale factor.
%    Nonetheless, it may be convenient to choose a particular normalization
%    for the weights.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2009
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
%    Input, integer OPTION, the normalization option.
%    0, no normalization is applied.
%    1, the weights are scaled so that the minimum nonzero entry is 1.
%    2, the weights are scaled so that they sum to DIM_NUM.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the weights.
%    The input values must be positive.
%
%    Output, real LEVEL_WEIGHT(DIM_NUM), the normalized weights.
%

%
%  Option 0, no normalization.
%
  if ( option == 0 )
%
%  Option 1, minimum (nonzero) entry is 1.
%
  elseif ( option == 1 )

    level_weight_min = Inf;

    found = 0;

    for dim = 1 : dim_num

      if ( 0.0 < level_weight(dim) )
        if ( level_weight(dim) < level_weight_min )
          level_weight_min = level_weight(dim);
          found = found + 1;
        end
      end

    end

    if ( found == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_ANISO_NORMALIZE - Fatal error!\n' );
      fprintf ( 1, '  Could not find a positive entry in LEVEL_WEIGHT.\n' );
      error ( 'SGMGA_ANISO_NORMALIZE - Fatal error!' );
    end

    level_weight(1:dim_num) = level_weight(1:dim_num) / level_weight_min;
%
%  Option 2, rescale so sum of weights is DIM_NUM.
%
  elseif ( option == 2 )

    level_weight_sum = sum ( level_weight(1:dim_num) );

    if ( level_weight_sum <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_ANISO_NORMALIZE - Fatal error!\n' );
      fprintf ( 1, '  LEVEL_WEIGHT entries have nonpositive sum.\n' );
      error ( 'SGMGA_ANISO_NORMALIZE - Fatal error!' );
    end

    level_weight(1:dim_num) = ( dim_num * level_weight(1:dim_num) ) ...
      / level_weight_sum;

  end

  return
end
