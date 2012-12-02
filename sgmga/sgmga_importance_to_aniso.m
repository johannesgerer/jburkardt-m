function level_weight = sgmga_importance_to_aniso ( dim_num, importance )

%*****************************************************************************80
%
%% SGMGA_IMPORTANCE_TO_ANISO: importance vector to anisotropic weight vector.
%
%  Discussion:
%
%    To specify the anisotropy of a multidimensional problem, the user is
%    allowed to specify an "importance vector".  This vector can contain
%    any set of positive values.  These values represent the relative
%    importance of each dimension.  These values, with a suitable normalization,
%    will be used to evaluate a constraint of the following form:
%
%      QMIN < Level(1) / Importance(1) + Level(2) / Importance(2) + ...
%             Level(N) / Importance(N) <= QMAX
%
%    and a set of levels that satisfies this constraint will then be included
%    in a given anistotropic sparse grid rule.  Thus, increasing the
%    importance value of a particular dimension allows larger level values
%    in that dimension to satisfy the constraint.
%
%    The program actually works with coefficients LEVEL_WEIGHT that are
%    the inverse of the importance vector entries, with a suitable
%    normalization.  This function is supplied to convert between the
%    more natural "importance vector" and the internally useful 
%    "level_weight" vector.
%
%    This function converts the importance vector to an unnormalized 
%    anisotropy weight vector. 
%
%    Note that some (but not all) of the IMPORTANCE vector entries may be zero.
%    This indicates that the corresponding dimension is of "zero" or
%    rather "minimal" importance.  In such a case, only a one-point quadrature
%    rule will be applied for that dimension, no matter what sparse grid
%    level is requested for the overall problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2010
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real IMPORTANCE(DIM_NUM), the importance vector.
%    All entries must be nonnegative, and at least one must be positive.
%
%    Output, real LEVEL_WEIGHT(DIM_NUM), the anisotropic
%    weights.
%
  if ( any ( importance(1:dim_num) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SGMGA_IMPORTANCE_TO_ANISO - Fatal error!\n' );
    fprintf ( 1, '  Some importance entries are not positive.\n' );
    error ( 'SGMGA_IMPORTANCE_TO_ANISO - Fatal error!' );
  end

  level_weight = zeros ( dim_num, 1 );

  found = 0;

  for dim = 1 : dim_num
    if ( 0.0 < importance(dim) )
      level_weight(dim) = 1.0 / importance(dim);
      found = found + 1;
    else
      level_weight(dim) = 0.0;
    end
  end

  if ( found == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SGMGA_IMPORTANCE_TO_ANISO - Fatal error!\n' );
    fprintf ( 1, '  No importance entry is positive.\n' );
    error ( 'SGMGA_IMPORTANCE_TO_ANISO - Fatal error!' )
  end

  return
end
