function sandia_sparse_test ( )

%*****************************************************************************80
%
%% SANDIA_SPARSE_TEST tests the SANDIA_SPARSE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
  rule_max = 7;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SPARSE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SANDIA_SPARSE library.\n' );
%
%  Test LEVELS_INDEX_SIZE for one example each of CFN, OFN, OWN and ONN rules.
%
  if ( 1 )

    rule = 1;

    dim_min = 1;
    dim_max = 1;
    level_max_min = 0;
    level_max_max = 10;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 1;
    dim_max = 6;
    level_max_min = 0;
    level_max_max = 6;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 6;
    dim_max = 10;
    level_max_min = 0;
    level_max_max = 4;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 100;
    dim_max = 100;
    level_max_min = 0;
    level_max_max = 2;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    rule = 2;

    dim_min = 1;
    dim_max = 1;
    level_max_min = 0;
    level_max_max = 10;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 1;
    dim_max = 6;
    level_max_min = 0;
    level_max_max = 6;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 6;
    dim_max = 10;
    level_max_min = 0;
    level_max_max = 4;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 100;
    dim_max = 100;
    level_max_min = 0;
    level_max_max = 2;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    rule = 5;

    dim_min = 1;
    dim_max = 1;
    level_max_min = 0;
    level_max_max = 10;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 1;
    dim_max = 6;
    level_max_min = 0;
    level_max_max = 6;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 6;
    dim_max = 10;
    level_max_min = 0;
    level_max_max = 4;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 100;
    dim_max = 100;
    level_max_min = 0;
    level_max_max = 2;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    rule = 7;

    dim_min = 1;
    dim_max = 1;
    level_max_min = 0;
    level_max_max = 10;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 1;
    dim_max = 6;
    level_max_min = 0;
    level_max_max = 6;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 6;
    dim_max = 10;
    level_max_min = 0;
    level_max_max = 4;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

    dim_min = 100;
    dim_max = 100;
    level_max_min = 0;
    level_max_max = 2;

    levels_index_size_test ( rule, dim_min, dim_max, level_max_min,  ...
      level_max_max );

  end
%
%  Test LEVELS_INDEX for one example each of CFN, OFN, OWN and ONN rules.
%
  if ( 1 )

    rule = 1;

    dim_num = 2;
    level_max = 1;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 2;
    level_max = 3;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 0;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 6;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    rule = 2;

    dim_num = 2;
    level_max = 1;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 2;
    level_max = 3;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 0;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 6;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    rule = 5;

    dim_num = 2;
    level_max = 1;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 2;
    level_max = 3;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 0;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 6;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    rule = 7;

    dim_num = 2;
    level_max = 1;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 2;
    level_max = 3;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 0;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 3;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

    dim_num = 6;
    level_max = 2;
    levels_index_test ( rule, dim_num, level_max );

  end
%
%  Test SPARSE_GRID by having it compute a few sparse grids based on each rule.
%
  if ( 1 )

    for rule = 1 : rule_max

      dim_num = 2;
      level_max = 1;
      sparse_grid_compute_test ( rule, dim_num, level_max );

      dim_num = 2;
      level_max = 2;
      sparse_grid_compute_test ( rule, dim_num, level_max );

      dim_num = 3;
      level_max = 1;
      sparse_grid_compute_test ( rule, dim_num, level_max );

    end

  end
%
%  Test SPARSE_GRID by having it compute a few sparse grids based on each rule,
%  and comparing the sum of the quadrature weights to the expected sum.
%
  if ( 1 )

    for rule = 1 : rule_max

      dim_num = 2;
      level_max = 4;
      sparse_grid_weight_test ( rule, dim_num, level_max );

      dim_num = 3;
      level_max = 0;
      sparse_grid_weight_test ( rule, dim_num, level_max );

      dim_num = 3;
      level_max = 1;
      sparse_grid_weight_test ( rule, dim_num, level_max );

      dim_num = 3;
      level_max = 6;
      sparse_grid_weight_test ( rule, dim_num, level_max );

      dim_num = 10;
      level_max = 3;
      sparse_grid_weight_test ( rule, dim_num, level_max );

    end

  end
%
%  Test SPARSE_GRID by having it compute a few sparse grids based on each rule,
%  and comparing estimated and exact monomial integrals.
%
  if ( 1 ) 

    for rule = 1 : rule_max

      dim_num = 2;
      level_max = 0;
      degree_max = 3;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 2;
      level_max = 1;
      degree_max = 5;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 2;
      level_max = 2;
      degree_max = 7;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 2;
      level_max = 3;
      degree_max = 9;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 3;
      level_max = 0;
      degree_max = 2;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 3;
      level_max = 1;
      degree_max = 4;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

      dim_num = 3;
      level_max = 2;
      degree_max = 6;
      sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max );

    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SPARSE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


