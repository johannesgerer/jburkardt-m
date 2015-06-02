function value = mono_upto_enum ( m, n )

%*****************************************************************************80
%
%% MONO_UPTO_ENUM enumerates monomials in M dimensions of degree up to N.
%
%  Discussion:
%
%    For M = 2, we have the following values:
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
%    In particular, VALUE(2,3) = 10 because we have the 10 monomials:
%
%      1, x, y, x^2, xy, y^2, x^3, x^2y, xy^2, y^3.
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
%    of total degree N or less.
%
  value = nchoosek ( n + m, n );

  return
end
