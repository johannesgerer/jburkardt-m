function quad = monte_carlo ( dim_num, m, f )

%*****************************************************************************80
%
%% MONTE_CARLO applies a Monte Carlo integration rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer M, the number of points to use.
%
%    Input, external real F, the name of the user-supplied routine
%    which evaluates the function, of the form:
%    function f ( dim_num, x )
%    integer dim_num
%    real f
%    real x(dim_num)
%    f = ...
%
%    Output, real QUAD, the estimated integral.
%
  quad = 0.0;

  for j = 1 : m
    x = rand ( dim_num, 1 );
    quad = quad + f ( dim_num, x );
  end

  quad = quad / m;

  return
end
