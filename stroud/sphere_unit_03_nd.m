function result = sphere_unit_03_nd ( func, n )

%*****************************************************************************80
%
%% SPHERE_UNIT_03_ND approximates surface integrals on the unit sphere in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N)**2 ) = 1.
%
%  Discussion:
%
%    A 2*N point 3rd degree formula is used, Stroud number UN:3-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2004
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

  w = 1.0E+00 / ( 2 * n );

  quad = 0.0E+00;
  for i = 1 : n
    x(i) = 1.0E+00;
    quad = quad + w * feval ( func, n, x );
    x(i) = - 1.0E+00;
    quad = quad + w * feval ( func, n, x );
    x(i) = 0.0E+00;
  end

  volume = sphere_unit_area_nd ( n );
  result = quad * volume;

  return
end
