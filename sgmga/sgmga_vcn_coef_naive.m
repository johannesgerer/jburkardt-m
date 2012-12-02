function coef = sgmga_vcn_coef_naive ( dim_num, level_weight, x_max, x, q_max )

%*****************************************************************************80
%
%% SGMGA_VCN_COEF_NAIVE returns the "next" constrained vector's coefficient.
%
%  Discussion:
%
%    This function uses a naive approach to the computation, resulting in
%    a set of 2^DIM_NUM tasks.  Hence it is not suitable for cases where
%    DIM_NUM is moderately large.  The function SGMGA_VCN_COEF carries out
%    a more complicated but more efficient algorithm for the same computation.
%
%    We are given a nonnegative vector X of dimension DIM_NUM which satisfies:
%
%      sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * X(I) <= Q_MAX
%
%    This routine computes the appropriate coefficient for X in the
%    anisotropic sparse grid scheme.
%
%    The coefficient is calculated as follows:
%
%      Let B be a binary vector of length N, and let ||B|| represent
%      the sum of the entries of B.
%
%      Coef = sum ( all B such that X+B satisfies constraints ) (-1)^||B||
%
%    Since X+0 satisfies the constraint, there is always at least one
%    summand.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2010
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
%    Input, integer DIM_NUM, the dimension of the vector.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weights.
%
%    Input, integer X_MAX(DIM_NUM), the maximum
%    values allowed in each component.
%
%    Input, integer X(DIM_NUM), a point which satisifies the constraints.
%
%    Input, real Q_MAX, the upper limit on the sum.
%
%    Output, real COEF, the combinatorial coefficient.
%

%
%  Force column vectors.
%
  level_weight = level_weight ( : );
  x = x ( : );

  b = zeros ( dim_num, 1 );
  coef = 1.0;

  while ( 1 )
%
%  Generate the next binary perturbation.
%
    b = binary_vector_next ( dim_num, b );
    b_sum = sum ( b(1:dim_num) );
%
%  We're done if we've got back to 0.
%
    if ( b_sum == 0 )
      break
    end
%
%  Perturb the vector.
%
    x2(1:dim_num,1) = x(1:dim_num,1) + b(1:dim_num,1);
%
%  Does it satisfy the XMAX constraint?
%  (THIS CHECK IS SURPRISINGLY NECESSARY, PARTLY BECAUSE OF ZERO WEIGHT).
%
    if ( any ( x_max(1:dim_num) < x2(1:dim_num) ) )
      continue
    end
%
%  Does it satisfy the Q_MAX constraint?
%
    q = level_weight(1:dim_num)' * x2(1:dim_num);

    if ( q <= q_max )
      coef = coef + r8_mop ( b_sum );
    end

  end

  return
end
