function sgmga_vcn_test ( dim_num, importance, level_weight, q_min, q_max )

%*****************************************************************************80
%
%% SGMGA_VCN_TEST tests SGMGA_VCN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_TEST\n' );
  fprintf ( 1, '  Consider vectors 0 <= LEVEL_1D(1:N) <= LEVEL_1D_MAX(1:N),\n' );
  fprintf ( 1, '  Set Q = sum ( LEVEL_WEIGHT(1:N) * LEVEL_1D(1:N) )\n' );
  fprintf ( 1, '  Accept only vectors for which Q_MIN < Q <= Q_MAX\n' );
  fprintf ( 1, '  No ordering is imposed on the LEVEL_1D values.\n' );
  fprintf ( 1, '  SGMGA_VCN_NAIVE uses a naive approach;\n' );
  fprintf ( 1, '  SGMGA_VCN tries to be more efficient.\n' );
  fprintf ( 1, '  Here, we just compare the results.\n' );

  level_1d_max = zeros ( dim_num, 1 );

  for dim = 1 : dim_num
    if ( 0.0 < level_weight(dim) )
      level_1d_max(dim) = floor ( q_max / level_weight(dim) ) + 1;
      if ( q_max <= ( level_1d_max(dim) - 1 ) * level_weight(dim) )
        level_1d_max(dim) = level_1d_max(dim) - 1;
      end
    else
      level_1d_max(dim) = 0;
    end
  end

  level_1d_min = zeros ( dim_num, 1 );

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
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SGMGA_VCN_NAIVE:\n' );
  fprintf ( 1, '     I          Q        X\n' );
  fprintf ( 1, '   MIN  %14f', q_min );
  for dim = 1 : dim_num
    fprintf ( 1, '  %2d', level_1d_min(dim) );
  end
  fprintf ( 1, '\n' );

  i = 0;
  more_grids = 0;
  level_1d = zeros ( dim_num, 1 );

  while ( 1 )

    [ level_1d, more_grids ] = sgmga_vcn_naive ( dim_num, level_weight, ...
      level_1d_max, level_1d, q_min, q_max, more_grids );

    if ( ~more_grids )
      break
    end

    q = level_weight(1:dim_num)' * level_1d(1:dim_num);
    i = i + 1;
    fprintf ( 1, '  %4d  %14f', i, q );
    for dim = 1 : dim_num
      fprintf ( 1, '  %2d', level_1d(dim) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '   MAX  %14f', q_max );
  for dim = 1 : dim_num
    fprintf ( 1, '  %2d', level_1d_max(dim) );
  end
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SGMGA_VCN:\n' );
  fprintf ( 1, '     I          Q        X\n' );
  fprintf ( 1, '   MIN  %14f', q_min );
  for dim = 1 : dim_num
    fprintf ( 1, '  %2d', level_1d_min(dim) );
  end
  fprintf ( 1, '\n' );

  i = 0;
  more_grids = 0;
  level_1d = zeros ( dim_num, 1 );

  while ( 1 )

    [ level_1d, more_grids ] = sgmga_vcn ( dim_num, level_weight, ...
      level_1d, q_min, q_max, more_grids );

    if ( ~more_grids )
      break
    end

    q = level_weight(1:dim_num)' * level_1d(1:dim_num);
    i = i + 1;
    fprintf ( 1, '  %4d  %14f', i, q );
    for dim = 1 : dim_num
      fprintf ( 1, '  %2d', level_1d(dim) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '   MAX  %14f', q_max );
  for dim = 1 : dim_num
    fprintf ( 1, '  %2d', level_1d_max(dim) );
  end
  fprintf ( 1, '\n' );

  return
end
