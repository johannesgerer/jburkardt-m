function quad = fibonacci_lattice_q1 ( k, f )

%*****************************************************************************80
%
%% FIBONACCI_LATTICE_Q1 applies a Fibonacci lattice integration rule in 2D.
%
%  Discussion:
%
%    This is a modification of the algorithm in FIBONACCI_LATTICE_Q.
%    It uses a nonlinear transformation on the integrand, which makes
%    the lattice rule more suitable for nonperiodic integrands.
%
%    The transformation replaces the integration variable X by
%
%      PHI(X) = 3*X^2 - 2*X**3
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
    dphi = 1.0;
    for i = 1 : dim_num
      y(i) = ( 3.0 - 2.0 * x(i) ) * x(i) * x(i);
      dphi = dphi * 6.0 * ( 1.0 - x(i) ) * x(i);
    end
    quad = quad + f ( dim_num, y ) * dphi;
  end

  quad = quad / m;

  return
end
