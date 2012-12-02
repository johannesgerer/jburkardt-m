function sgmga_size_tabulate ( rule_1d, growth_1d, np_1d, p_1d, dim_min, dim_max, ...
  level_max_min, level_max_max )

%****************************************************************************80
%
%% SGMGA_SIZE_TABULATE tests SGMGA_SIZE.
%
%  Discussion:
%
%    We do NOT consider mixed rules.  Instead, we are looking at sparse grid
%    rules for which all dimensions use the same 1D rule family.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RULE_1D, the 1D rule.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested.
%     2, "F2",  Fejer Type 2, Open Fully Nested.
%     3, "GP",  Gauss Patterson, Open Fully Nested.
%     4, "GL",  Gauss Legendre, Open Weakly Nested.
%     5, "GH",  Gauss Hermite, Open Weakly Nested.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested.
%     7, "LG",  Gauss Laguerre, Open Non Nested.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested.
%     9, "GJ",  Gauss Jacobi, Open Non Nested.
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH_1D, the desired growth in each dimension.
%    0, "DF", default growth associated with this quadrature rule;
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Input, integer NP_1D, the number of parameters in the 1D rule.
%
%    Input, real P_1D(NP_1D), the parameters.
%
%    Input, integer DIM_MIN, the minimum spatial dimension.
%
%    Input, integer DIM_MAX, the maximum spatial dimension.
%
%    Input, integer LEVEL_MAX_MIN, the minimum value of LEVEL_MAX.
%
%    Input, integer LEVEL_MAX_MAX, the maximum value of LEVEL_MAX.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_SIZE_TABULATE\n' );
  fprintf ( 1, '  SGMGA_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the same rule in all dimensions, and count the points\n' );
  fprintf ( 1, '  for a range of dimensions and levels.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1D rule index is %d\n', rule_1d );
  fprintf ( 1, '  1D growth rule is %d\n', growth_1d );
  fprintf ( 1, '\n' );

  tol = sqrt ( eps );

  fprintf ( 1, '   DIM: ' );
  for dim_num = dim_min : dim_max
    fprintf ( 1, '  %8d', dim_num );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   LEVEL_MAX\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max

    fprintf ( 1, '    %4d', level_max );

    for dim_num = dim_min : dim_max
%
%  Failure to clear these variables results in obscure and
%  highly annoying errors caused by MATLAB's insistence on
%  assuming it knows the size of the array and passing that
%  on implicitly.
%
      clear growth;
      clear level_weight;
      clear rule;
      clear np;

      growth(1:dim_num) = growth_1d;
      level_weight(1:dim_num,1) = 1;
      rule(1:dim_num,1) = rule_1d;
      np(1:dim_num,1) = np_1d;
      np_sum = sum ( np );
      p = zeros ( np_sum, 1 );
      for dim = 1 : dim_num
        p(1+(dim-1)*np_1d:np_1d+(dim-1)*np_1d) = p_1d(1:np_1d);
      end

      point_num = sgmga_size ( dim_num, level_weight, level_max, rule, ...
        growth, np, p, tol );

      fprintf ( 1, '  %8d', point_num );

    end

    fprintf ( 1, '\n' );

  end

  return
end
