function sgmga_importance_to_aniso_test ( dim_num, importance )

%*****************************************************************************80
%
%% SGMGA_IMPORTANCE_TO_ANISO_TEST calls SGMGA_IMPORTANCE_TO_ANISO.
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
  fprintf ( 1, 'SGMGA_IMPORTANCE_TO_ANISO_TEST\n' );
  fprintf ( 1, '  Importances:\n' );
  for dim = 1 : dim_num
    fprintf ( 1, '  %12f', importance(dim) );
  end
  fprintf ( 1, '\n' );

  level_weight = sgmga_importance_to_aniso ( dim_num, importance );

  fprintf ( 1, '  Anistropic coefficients:\n' );
  for dim = 1 : dim_num
    fprintf ( 1, '  %12f', level_weight(dim) );
  end
  fprintf ( 1, '\n' );

  return
end
