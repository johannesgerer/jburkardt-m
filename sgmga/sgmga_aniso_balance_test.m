function sgmga_aniso_balance_test ( alpha_max, dim_num, level_weight )

%*****************************************************************************80
%
%% SGMGA_ANISO_BALANCE_TEST calls SGMGA_ANISO_BALANCE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_ANISO_BALANCE_TEST\n' );
  fprintf ( 1, '  ALPHA_MAX = %f\n', alpha_max );
  fprintf ( 1, '  Input weight sum: %f\n', sum ( level_weight(1:dim_num) ) );
  for dim = 1 : dim_num
    fprintf ( 1, '  %12f', level_weight(dim) );
  end
  fprintf ( 1, '\n' );

  level_weight2 = sgmga_aniso_balance ( alpha_max, dim_num, level_weight );

  fprintf ( 1, '  Output weight sum: %f\n', sum ( level_weight2(1:dim_num) ) );
  for dim = 1 : dim_num
    fprintf ( 1, '  %12f', level_weight2(dim) );
  end
  fprintf ( 1, '\n' );

  return
end
