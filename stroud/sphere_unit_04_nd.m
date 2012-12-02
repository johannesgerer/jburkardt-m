function result = sphere_unit_04_nd ( func, n )

%*****************************************************************************80
%
%% SPHERE_UNIT_04_ND approximates surface integrals on the unit sphere in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N)**2 ) = 1.
%
%  Discussion:
%
%    A 2*N**2 point 5th degree formula is used, Stroud number UN:5-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
%
%  Author:
%
%    John Burkardt
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

  w1 = ( 4 - n ) / ( 2 * n * ( n + 2 ) );

  quad = 0.0E+00;

  for i = 1 : n
    x(i) = 1.0E+00;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = - 1.0E+00;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = 0.0E+00;
  end

  s = 1.0E+00 / sqrt ( 2.0E+00 );
  w2 = 1.0E+00 / ( n * ( n + 2 ) );

  for i = 1 : n

    x(i) = s;

    for j = i+1 : n
      x(j) = s;
      quad = quad + w2 * feval ( func, n, x );
      x(j) = -s;
      quad = quad + w2 * feval ( func, n, x );
      x(j) = 0.0E+00;
    end

    x(i) = - s;

    for j = i+1 : n
      x(j) = s;
      quad = quad + w2 * feval ( func, n, x );
      x(j) = -s;
      quad = quad + w2 * feval ( func, n, x );
      x(j) = 0.0E+00;
    end

    x(i) = 0.0E+00;

  end

  volume = sphere_unit_area_nd ( n );
  result = quad * volume;

  return
end
