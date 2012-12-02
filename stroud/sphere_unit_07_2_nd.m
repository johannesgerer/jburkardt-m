function result = sphere_unit_07_2_nd ( func, n )

%*****************************************************************************80
%
%% SPHERE_UNIT_07_2_ND approximates surface integrals on the unit sphere in ND.
%
%  Integration region:
%
%    sum ( X(1:N)**2 ) = 1.
%
%  Discussion:
%
%    A 2**N * ( N + 1 ) point 7th degree formula is used, Stroud number UN:7-2.
%
%    Some of the weights in this quadrature formula are negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 May 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X), at the N dimensional point
%    X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Output, real RESULT, the approximate integral of the function.
%
  x(1:n) = 0.0E+00;

  w1 = - n * n / ( 2^(n+3) * ( n + 2 ) );
  w2 = ( ( n + 4 )^2 ) / ( 2^(n+3) * n * ( n + 2 ) );
  x1 = 1.0 / sqrt ( n );
  x2 = sqrt ( 5.0 / ( n + 4 ) );
  x3 = 1.0 / sqrt ( n + 4 );

  quad = 0.0;

  x(1:n) = x1;

  while ( 1 )

    quad = quad + w1 * feval ( func, n, x );

    [ x, done ] = r8vec_mirror_next ( n, x );

    if ( done )
      break
    end

  end

  for i = 1 : n

    x(1:n) = x3;
    x(i) = x2;

    while ( 1 )

      quad = quad + w2 * feval ( func, n, x );

      [ x, done ] = r8vec_mirror_next ( n, x );

      if ( done )
        break
      end

    end

  end

  volume = sphere_unit_area_nd ( n );
  result = quad * volume;

  return
end
