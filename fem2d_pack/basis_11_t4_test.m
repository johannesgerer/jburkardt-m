function basis_11_t4_test ( )

%*****************************************************************************80
%
%% BASIS_11_T4_TEST verifies BASIS_11_T4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2009
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
    4.0, 3.0; ...
    0.0, 4.0; ...
    0.0, 0.0 ]';
%
%  The node associated with the fourth basis function is the centroid.
%
  t(1,4) = sum ( t(1,1:3) ) / 3.0;
  t(2,4) = sum ( t(2,1:3) ) / 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASIS_11_T4_TEST:\n' );
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

  for i = 1 : node_num
    for j = 1 : node_num
      [ phi(i,j), dphidx(i,j), dphidy(i,j) ] = basis_11_t4 ( t, i, t(1:2,j) );
    end
  end

  for i = 1 : node_num
    fprintf ( 1, '  %7f  %7f  %7f  %7f\n', phi(i,1:node_num) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The X and Y derivatives should sum to 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      dPhidX sum    dPhidY sum\n' );
  fprintf ( 1, '\n' );

  for j = 1 : node_num

    sum_x = sum ( dphidx(1:node_num,j) );
    sum_y = sum ( dphidy(1:node_num,j) );
    fprintf ( 1, '  %14e  %14e\n', sum_x, sum_y );

  end

  return
end
