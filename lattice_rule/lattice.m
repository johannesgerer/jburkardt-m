function quad = lattice ( dim_num, m, z, f )

%*****************************************************************************80
%
%% LATTICE applies a lattice integration rule.
%
%  Discussion:
%
%    Because this is a standard lattice rule, it is really only suited
%    for functions which are periodic, of period 1, in both X and Y.
%
%    For a suitable F, and a given value of M (the number of lattice points),
%    the performance of the routine is affected by the choice of the
%    generator vector Z.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer M, the order (number of points) of the rule.
%
%    Input, integer Z(DIM_NUM), the generator vector.  Typically, the elements
%    of Z satisfy 1 <= Z(1:DIM_NUM) < M, and are relatively prime to M.
%    This is easy to guarantee if M is itself a prime number.
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

  for j = 0 : m - 1
    x(1:dim_num) = mod ( j * z(1:dim_num) / m, 1.0 );
    quad = quad + f ( dim_num, x );
  end

  quad = quad / m;

  return
end
