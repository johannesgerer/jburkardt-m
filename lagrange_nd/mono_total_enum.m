function value = mono_total_enum ( d, n )

%*****************************************************************************80
%
%% MONO_TOTAL_ENUM enumerates monomials in D dimensions of degree equal to N.
%
%  Discussion:
%
%    For D = 3, we have the following values:
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
%    18 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer N, the maximum degree.
%
%    Output, integer VALUE, the number of monomials in D variables,
%    of total degree N.
%
  value = nchoosek ( n + d - 1, n );

  return
end

