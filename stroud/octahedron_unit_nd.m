function result = octahedron_unit_nd ( func, n )

%*****************************************************************************80
%
%% OCTAHEDRON_UNIT_ND approximates integrals in a unit octahedron in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( Abs ( X(1:N) ) ) <= 1.
%
%  Discussion:
%
%    A 2*N point 3rd degree formula is used, Stroud number GN:3-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
%
%  Author
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
%    function of which is to be integrated, of the form:
%      function func ( n, x )
%
%    Input, integer N, the dimension of the octahedron.
%
%    Output, real RESULT, the approximate integral of the function.
%
  w = 1.0E+00 / ( 2 * n );
  r = sqrt ( ( 2 * n ) / ( ( n + 1 ) * ( n + 2 ) ) );

  x(1:n) = 0.0E+00;

  quad = 0.0E+00;
  for i = 1 : n
    x(i) = r;
    for j = 1 : 2
      quad = quad + w * feval ( func, n, x );
      x(i) = -x(i);
    end
    x(i) = 0.0E+00;
  end

  volume = octahedron_unit_volume_nd ( n );
  result = quad * volume;

  return
end
