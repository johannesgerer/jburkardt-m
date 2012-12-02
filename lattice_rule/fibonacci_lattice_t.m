function quad = fibonacci_lattice_t ( k, f )

%*****************************************************************************80
%
%% FIBONACCI_LATTICE_T applies a symmetric Fibonacci lattice integration rule in 2D.
%
%  Discussion:
%
%    This routine may be applied to integrands which are not periodic.
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
%
%  Get all the corner values.
%
  rank = 0;
  quad1 = 0.0;
  w = 1.0 / 2^dim_num;
  z = [];

  while ( 1 )

    z = tuple_next ( 0, 1, dim_num, rank, z );

    if ( rank == 0 )
      break
    end

    x(1:dim_num) = z(1:dim_num);
    quad1 = quad1 + w * f ( dim_num, x );

  end
%
%  Get the interior values.
%
  z(1) = 1;
  z(2) = fibonacci ( k - 1 );

  quad2 = 0.0;
  for j = 1 : m - 1
    x(1:dim_num) = mod ( j * z(1:dim_num) / m, 1.0 );
    quad2 = quad2 + f ( dim_num, x );
  end

  quad = ( quad1 + quad2 ) / m;

  return
end
