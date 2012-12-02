function basis_mn_t4_test ( )

%*****************************************************************************80
%
%% BASIS_MN_T4_TEST verifies BASIS_MN_T4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  node_num = 4;

  t = [ ...
    2.0, 0.0; ...
    4.0, 2.0; ...
    0.0, 4.0; ...
    2.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASIS_MN_T4_TEST:\n' );
  fprintf ( 1, '  Verify basis functions for element T4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Physical Nodes:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : node_num
    fprintf ( 1, '  %8d  %7f  %7f\n', j, t(1:2,j) );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The basis function values at basis nodes\n' );
  fprintf ( 1, '  should form the identity matrix.\n' );
  fprintf ( 1, '\n' );

  [ phi, dphidx, dphidy ] = basis_mn_t4 ( t, node_num, t );

  for i = 1 : node_num
    for j = 1 : node_num
      fprintf ( 1, '  %7f', phi(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The X and Y derivatives should sum to 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      dPhidX sum    dPhidY sum\n' );
  fprintf ( 1, '\n' );

  for j = 1 : node_num

    sum_x = sum ( dphidx(1:node_num,j) );
    sum_y = sum ( dphidy(1:node_num,j) );
    fprintf ( 1, '  %14f  %14f\n', sum_x, sum_y );

  end

  return
end
