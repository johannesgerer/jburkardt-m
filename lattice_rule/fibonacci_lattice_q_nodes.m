function x = fibonacci_lattice_q_nodes ( k )

%*****************************************************************************80
%
%% FIBONACCI_LATTICE_Q_NODES returns Fibonacci lattice nodes in 2D.
%
%  Discussion:
%
%    Because this is a standard lattice rule, it is really only suited
%    for functions which are periodic, of period 1, in both X and Y.
%
%    The number of nodes returned is
%
%      M = fibonacci ( k ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994,
%    ISBN: 0198534728,
%    LC: QA311.S56
%
%  Parameters:
%
%    Input, integer K, the index of the Fibonacci number to be used.
%    K must be at least 3.
%
%    Output, real X(2,M), the nodes.
%
  dim_num = 2;

  m = fibonacci ( k );

  z(1) = 1;
  z(2) = fibonacci ( k - 1 );

  for j = 0 : m - 1
    x(1:dim_num,j+1) = mod ( j * z(1:dim_num) / m, 1.0 );
  end

  return
end
