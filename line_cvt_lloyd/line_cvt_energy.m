function e = line_cvt_energy ( n, a, b, x )

%*****************************************************************************80
%
%% LINE_CVT_ENERGY computes the CVT energy for a given set of generators.
%
%  Discussion:
%
%    Given a set of generators G over the line [A,B], then the energy
%    is defined as
%      E = integral ( a <= x <= b ) ( x - g(x) )^2 dx
%    where g(x) is the nearest generator to the point x.
%
%    For the 1D case, this integral can be evaluated exactly as the
%    sum of integrals over each subinterval:
%
%      E(i) = integral ( xl <= x <= xr ) ( x - x(i) )^2 dx
%           = ( ( x(i) - xl )^3 + ( xr - x(i) )^3 ) / 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, real A, B, the left and right endpoints.
%
%    Input, real X(N), the generator locations.
%
%    Output, real E, the energy of the generator distribution.
%
  e = 0.0;

  for j = 1 : n

    if ( j == 1 )
      xl = a;
    else
      xl = ( x(j-1) + x(j) ) / 2.0;
    end

    if ( j == n )
      xr = b;
    else
      xr = ( x(j) + x(j+1) ) / 2.0;
    end

    e = e + ( ( x(j) - xl )^3 + ( xr - x(j) )^3  ) / 3.0;

  end 

  return
end
