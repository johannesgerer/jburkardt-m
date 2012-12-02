function quad = fibonacci_lattice_b ( k, f )

%*****************************************************************************80
%
%% FIBONACCI_LATTICE_B applies an optimal Fibonacci lattice integration rule in 2D.
%
%  Discussion:
%
%    This routine may be applied to integrands which are not periodic.
%
%    When K is odd, this is the same as the symmetric Fibonacci lattice
%    integration rule.  But when K is even, a correction is made to the
%    corner weights which is expected to improve the results.
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
  n = fibonacci ( k - 1 );
%
%  Get the corner weights.
%
  if ( mod ( k, 2 ) == 1 )

    w(1:2,1:2) = 1.0 / ( 4 * m );

  else

     delta = 0.0;
     for j = 1 : m - 1
       delta = delta + j * mod ( j * n, m ) / m^2;
     end
     w(1,1) = 0.25 - delta / m;

     delta = 0.0;
     for j = 1 : m - 1
       delta = delta + j * ( m - mod ( j * n, m ) ) / m^2;
     end
     w(1,2) = 0.25 - delta / m;

     w(2,1) = w(1,2);
     w(2,2) = w(1,1);

  end
%
%  Get all the corner values.
%
  rank = 0;
  quad1 = 0.0;
  z = [];

  while ( 1 )

    z = tuple_next ( 0, 1, dim_num, rank, z );

    if ( rank == 0 )
      break;
    end

    x(1:dim_num) = z;
    quad1 = quad1 + w(z(1)+1,z(2)+1) * f ( dim_num, x );

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

  quad = quad1 + quad2 / m;

  return
end
