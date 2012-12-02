function result = sphere_unit_07_1_nd ( func, n )

%*****************************************************************************80
%
%% SPHERE_UNIT_07_1_ND approximates surface integrals on the unit sphere in ND.
%
%  Integration region:
%
%    sum ( X(1:N)**2 ) = 1.
%
%  Discussion:
%
%    A 2**N + 2*N**2 point 7th degree formula is used, Stroud number UN:7-1.
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
  w1 = ( 8 - n ) / ( n * ( n + 2 ) * ( n + 4 ) );
  w2 = ( n^3 ) / ( 2^n * n * ( n + 2 ) * ( n + 4 ) );
  w3 = 4.0 / ( n * ( n + 2 ) * ( n + 4 ) );

  x1 = 1.0;
  x2 = 1.0 / sqrt ( n );
  x3 = 1.0 / sqrt ( 2.0 );

  x(1:n) = 0.0;

  quad = 0.0;
%
%  First term.
%
  for i = 1 : n
    x(i) = x1;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = -x1;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = 0.0;
  end
%
%  Second term.
%
  x(1:n) = x2;

  while ( 1 )

    quad = quad + w2 * feval ( func, n, x );

    [ x, done ] = r8vec_mirror_next ( n, x );

    if ( done )
      break
    end

  end
%
%  Third term.
%
  x(1:n) = 0.0;

  for i = 1 : n-1
    for j = i+1 : n
      x(i) = x3;
      x(j) = x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = -x3;
      x(j) = x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = x3;
      x(j) = -x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = -x3;
      x(j) = -x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = 0.0;
      x(j) = 0.0;
    end
  end

  volume = sphere_unit_area_nd ( n );
  result = quad * volume;

  return
end
