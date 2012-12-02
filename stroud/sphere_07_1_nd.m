function result = sphere_07_1_nd ( func, n, xc, r )

%*****************************************************************************80
%
%% SPHERE_07_1_ND approximates surface integrals on a sphere in ND.
%
%  Integration region:
%
%    sum ( X(1:N) - XC(1:N) )**2 = R**2.
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
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
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
%    Input, real XC(N), the center of the sphere.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real RESULT, the approximate integral of the function.
%
  x(1:n) = xc(1:n);

  w1 = ( 8 - n ) / ( n * ( n + 2 ) * ( n + 4 ) );
  w2 = ( n^3 ) / ( 2^n * n * ( n + 2 ) * ( n + 4 ) );
  w3 = 4.0E+00 / ( n * ( n + 2 ) * ( n + 4 ) );

  x1 = 1.0E+00;
  x2 = 1.0E+00 / sqrt ( n );
  x3 = 1.0E+00 / sqrt ( 2.0 );

  quad = 0.0E+00;
%
%  First term.
%
  for i = 1 : n
    x(i) = xc(i) + r * x1;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = xc(i) - r * x1;
    quad = quad + w1 * feval ( func, n, x );
    x(i) = xc(i);
  end
%
%  Second term.
%
%  In order to keep the R8VEC_MIRROR_NEXT routine happy, we need
%  to set the vector X to be the perturbation from XC.
%
  x(1:n) = r * x2;

  while ( 1 )

    quad = quad + w2 * feval ( func, n, xc(1:n) + x(1:n) );
    
    [ x, done ] = r8vec_mirror_next ( n, x );

    if ( done )
      break
    end

  end
%
%  Third term.
%
  x(1:n) = xc(1:n);

  for i = 1 : n-1
    for j = i+1 : n
      x(i) = xc(i) + r * x3;
      x(j) = xc(j) + r * x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = xc(i) - r * x3;
      x(j) = xc(j) + r * x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = xc(i) + r * x3;
      x(j) = xc(j) - r * x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = xc(i) - r * x3;
      x(j) = xc(j) - r * x3;
      quad = quad + w3 * feval ( func, n, x );
      x(i) = xc(i);
      x(j) = xc(j);
    end
  end

  volume = sphere_area_nd ( n, r );
  result = quad * volume;

  return
end
