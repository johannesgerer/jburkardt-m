function sandia_sgmgg_test04 ( )

%*****************************************************************************80
%
%% SANDIA_SGMGG_TEST04 simulates a set of incremental coefficient calculations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  point_num = 8;

  sparse_index = [ ...
    0, 0; ...
    0, 1; ...
    0, 2; ...
    0, 3; ...
    1, 0; ...
    1, 1; ...
    2, 0; ...
    3, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SGMGG_TEST04:\n' );
  fprintf ( 1, '  Simulate incremental coefficient calculations.\n' );
%
%  Generalized grid in 2D.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generalized grid in 2D:\n' );

  for point_num2 = 1 : point_num
    sandia_sgmgg_coef_naive_test ( dim_num, point_num2, sparse_index );
  end

  return
end
