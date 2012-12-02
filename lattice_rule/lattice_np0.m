function quad = lattice_np0 ( dim_num, m, z, f )

%*****************************************************************************80
%
%% LATTICE_NP0 applies a lattice integration rule to a nonperiodic function.
%
%  Discussion:
%
%    This routine attempts to modify a lattice rule, suitable for use
%    with a periodic function, for use with a nonperiodic function F(X),
%    essentially by applying the lattice rule to the function
%
%      G(X) = ( F(X) + F(1-X) ) / 2
%
%    This is the rule in 1 dimension.  In two dimensions, we have
%
%      G(X,Y) = ( F(X,Y) + F(X,1-Y) + F(1-X,Y) + F(1-X,1-Y) ) / 4
%
%    with the obvious generalizations to higher dimensions.
%
%    Drawbacks of this approach include:
%
%    * in dimension DIM_NUM, we must evaluate the function F at
%      2**DIM_NUM points for every single evaluation of G;
%
%    * the function G, regarded as a periodic function, is continuous,
%      but not generally differentiable, at 0 and 1.
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
%    Seymour Haber,
%    Parameters for Integrating Periodic Functions of Several Variables,
%    Mathematics of Computation,
%    Volume 41, Number 163, July 1983, pages 115-129.
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
%
%  Generate all DIM_NUM-tuples for which the I-th element is X(I) or 1-X(I).
%
    gray = - dim_num;

    while ( 1 )

      gray = gray_next ( dim_num, gray );

      if ( gray == - dim_num )
        break
      end

      if ( gray == 0 )
        y(1:dim_num) = x(1:dim_num);
      else
        y( abs ( gray ) ) = 1.0 - y( abs ( gray ) );
      end

      quad = quad + f ( dim_num, y );

    end

  end

  quad = quad / ( 2^dim_num * m );

  return
end
