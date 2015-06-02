function value = mono_total_enum ( m, n )

%*****************************************************************************80
%
%% MONO_TOTAL_ENUM enumerates monomials in M dimensions of degree equal to N.
%
%  Discussion:
%
%    For M = 3, we have the following values:
%
%    N  VALUE
%
%    0    1
%    1    3
%    2    6
%    3   10
%    4   15
%    5   21
%
%    In particular, VALUE(3,3) = 10 because we have the 10 monomials:
%
%      x^3, x^2y, x^2z, xy^2, xyz, xz^3, y^3, y^2z, yz^2, z^3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the maximum degree.
%
%    Output, integer VALUE, the number of monomials in D variables,
%    of total degree N.
%
  value = nchoosek ( n + m - 1, n );

  return
end

