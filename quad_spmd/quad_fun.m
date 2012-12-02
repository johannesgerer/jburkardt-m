function value = quad_fun ( n )

%*****************************************************************************80
%
%% QUAD_FUN demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    A block of statements that begin with the SPMD command are carried
%    out in parallel over all the LAB's.  Each LAB has a unique value
%    of LABINDEX, between 1 and NUMLABS.
%
%    Values computed by each LAB are stored in a composite variable.
%    The client copy of MATLAB can access these values by using an index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to use in each subinterval.
%
%    Output, real VALUE, the estimate for the integral.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_FUN\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPMD command\n' );
  fprintf ( 1, '  to carry out a parallel computation.\n' );
%
%  The entire integral goes from 0 to 1.
%  Each LAB, from 1 to NUMLABS, computes its subinterval [A,B].
%
  fprintf ( 1, '\n' );

  spmd
    a = ( labindex - 1 ) / numlabs;
    b =   labindex       / numlabs;
    fprintf ( 1, '  Lab %d works on [%f,%f].\n', labindex, a, b );
  end
%
%  Each LAB now estimates the integral, using N points.
%
  fprintf ( 1, '\n' );

  spmd
    if ( n == 1 )
      quad_local = ( b - a ) * f ( ( a + b ) / 2 );
    else
      x = linspace ( a, b, n );
      fx = f ( x );
      quad_local = ( b - a ) * ( fx(1) + 2 * sum ( fx(2:n-1) ) + fx(n) ) ...
        / 2.0 / ( n - 1 );
    end
    fprintf ( 1, '  Lab %d computed approximation %f\n', labindex, quad_local );
  end
%
%  The variable Q has been computed by each LAB.  
%  Variables computed inside an SPMD statement are stored as "composite"
%  variables, similar to MATLAB's cell arrays.  Outside of an SPMD
%  statement, composite variable values are accessible to the
%  client copy of MATLAB by index.
%
%  The GPLUS function adds the individual values, returning 
%  the sum to each LAB - so QUAD is also a composite value,
%  but all its values are equal.
%
  spmd
    quad = gplus ( quad_local );
  end
%
%  Outside of an SPMD statement, the client copy of MATLAB can
%  access any entry in a composite variable by indexing it.
%
  value = quad{1};

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Result of quadrature calculation:\n' );
  fprintf ( 1, '  Estimate QUAD = %24.16f\n', value );
  fprintf ( 1, '  Exact value   = %24.16f\n', pi );
  fprintf ( 1, '  Error         = %e\n', abs ( value - pi ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_FUN\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function value = f ( x )

%*****************************************************************************80
%
%% F is the function to be integrated.
%
%  Discussion:
%
%    The integral of F(X) from 0 to 1 is exactly PI.
%
%  Modified:
%
%    17 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the values where the integrand is to be evaluated.
%
%    Output, real VALUE(), the integrand values.
%
  value = 4.0 ./ ( 1 + x.^2 );

  return
end

  
