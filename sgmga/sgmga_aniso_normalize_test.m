function sgmga_aniso_normalize_test ( dim_num, level_weight )

%*****************************************************************************80
%
%% SGMGA_ANISO_NORMALIZE_TEST calls SGMGA_ANISO_NORMALIZE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_ANISO_NORMALIZE_TEST\n' );
  fprintf ( 1, '  Input weight sum: %f\n', sum ( level_weight(1:dim_num) ) );
  for dim = 1 : dim_num
    fprintf ( 1, '  %12f', level_weight(dim) );
  end
  fprintf ( 1, '\n' );

  for option = 0 : 2

    level_weight = sgmga_aniso_normalize ( option, dim_num, level_weight );

    fprintf ( 1, '  For OPTION = %d,  Normalized weight sum: %f\n', ...
      option, sum ( level_weight(1:dim_num) ) );
    for dim = 1 : dim_num
      fprintf ( 1, '  %12f', level_weight(dim) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
