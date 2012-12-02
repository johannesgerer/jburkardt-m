function sgmga_vcn_coef_test ( dim_num, importance, level_weight, ...
  level_max_min, level_max_max )

%*****************************************************************************80
%
%% SGMGA_VCN_COEF_TEST tests SGMGA_VCN_COEF.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_COEF_TEST\n' );
  fprintf ( 1, '  For anisotropic problems, a "combinatorial coefficent"\n' );
  fprintf ( 1, '  must be computed for each component product grid.\n' );
  fprintf ( 1, '  SGMGA_VCN_COEF_NAIVE does this in a simple, inefficient way.\n' );
  fprintf ( 1, '  SGMGA_VCN_COEF tries to be more efficient.\n' );
  fprintf ( 1, '  Here, we simply check that the two agree.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  IMPORTANCE:\n');
  for dim = 1 : dim_num
    fprintf ( 1, '  %14f', importance(dim) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_WEIGHT:\n');
  for dim = 1 : dim_num
    fprintf ( 1, '  %14f', level_weight(dim) );
  end
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max

    i = 0;
    coef1_sum = 0.0;
    coef2_sum = 0.0;
%
%  Initialization.
%
    level_weight_min_pos = r8vec_min_pos ( dim_num, level_weight );
    q_min = level_max * level_weight_min_pos - sum ( level_weight(1:dim_num) );
    q_max = level_max * level_weight_min_pos;
    level_1d_min = zeros(dim_num, 1 );
    for dim = 1 : dim_num
      if ( 0.0 < level_weight(dim) )
        level_1d_max(dim,1) = floor ( q_max / level_weight(dim) ) + 1;
      else
        level_1d_max(dim,1) = 0;
      end
    end
    more_grids = 0;
    level_1d = zeros ( dim_num, 1 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I          Q           Coef1       Coef2    X\n' );
    fprintf ( 1, '   MIN  %14f                        ', q_min );
    for dim = 1 : dim_num
      fprintf ( 1, '  %2d', level_1d_min(dim) );
    end
    fprintf ( 1, '\n' );

%
%  Seek all vectors LEVEL_1D which satisfy the constraint.
%
%    LEVEL_MAX * LEVEL_WEIGHT_MIN_POS - sum ( LEVEL_WEIGHT ) 
%      < sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * LEVEL_1D(I)
%      <= LEVEL_MAX * LEVEL_WEIGHT_MIN_POS.
%
    while ( 1 )

      [ level_1d, more_grids ] = sgmga_vcn_ordered ( dim_num, level_weight, ...
        level_1d_max, level_1d, q_min, q_max, more_grids );

      if ( ~more_grids )
        break
      end
%
%  Compute the combinatorial coefficient.
%
      coef1 = sgmga_vcn_coef_naive ( dim_num, level_weight, level_1d_max, ...
        level_1d, q_max );

      coef2 = sgmga_vcn_coef ( dim_num, level_weight, level_1d, q_max );

      i = i + 1;

      q = level_weight(1:dim_num)' * level_1d(1:dim_num);

      coef1_sum = coef1_sum + coef1;
      coef2_sum = coef2_sum + coef2;

      fprintf ( 1, '  %4d  %14f  %10f  %10f', i, q, coef1, coef2 );
      for dim = 1 : dim_num
        fprintf ( 1, '  %2d', level_1d(dim) );
      end
      fprintf ( 1, '\n' );

    end

    fprintf ( 1, '   MAX  %14f                        ', q_max );
    for dim = 1 : dim_num
      fprintf ( 1, '  %2d', level_1d_max(dim) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '   SUM                  %10f  %10f\n', coef1_sum, coef2_sum );

  end

  return
end
