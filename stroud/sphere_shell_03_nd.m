function result = sphere_shell_03_nd ( func, n, xc, r1, r2 )

%*****************************************************************************80
%
%% SPHERE_SHELL_03_ND approximates an integral inside a spherical shell in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      R1**2 <= Sum ( X(1:N) - XC(1:N) )**2 <= R2**2.
%
%  Discussion:
%
%    An 2*N point 3-rd degree formula is used, Stroud number SN-Shell:3-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
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
%    function which evaluates F at the N-vector X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Input, real XC(N), the center of the spheres.
%
%    Input, real R1, R2, the inner and outer radiuses that
%    define the spherical shell.
%
%    Output, real RESULT, the approximate integral of the function.
%
  if ( r1 == r2 )
    result = 0.0E+00;
    return
  end

  rho = r1 / r2;

  r = n * ( 1.0E+00 - rho^(n+2) ) / ( ( n + 2 ) * ( 1.0E+00 - rho^n ) );
  r = sqrt ( r );
  w = 1.0E+00 / ( 2 * n );

  x(1:n) = xc(1:n);

  quad = 0.0E+00;
  for i = 1 : n
    x(i) = xc(i) + r * r2;
    quad = quad + w * feval ( func, n, x );
    x(i) = xc(i) - r * r2;
    quad = quad + w * feval ( func, n, x );
    x(i) = xc(i);
  end

  volume = sphere_shell_volume_nd ( n, r1, r2 );
  result = quad * volume;

  return
end
