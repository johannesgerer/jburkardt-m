function quad = fibonacci_lattice_q ( k, f )

%*****************************************************************************80
%
%% FIBONACCI_LATTICE_Q applies a Fibonacci lattice integration rule in 2D.
%
%  Discussion:
%
%    Because this is a standard lattice rule, it is really only suited
%    for functions which are periodic, of period 1, in both X and Y.
%
%    The related routines FIBONACCI_LATTICE_S and FIBONACCI_LATTICE_B
%    may be helpful in cases where the integrand does not satisfy this
%    requirement.
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
%    Input, integer K, the index of the Fibonacci number to be used.
%    K must be at least 3.
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
  dim_num = 2;

  quad = 0.0;

  m = fibonacci ( k );

  z(1) = 1;
  z(2) = fibonacci ( k - 1 );

  for j = 0 : m - 1
    x(1:dim_num) = mod ( j * z(1:dim_num) / m, 1.0 );
    quad = quad + f ( dim_num, x );
  end

  quad = quad / m;

  return
end
