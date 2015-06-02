function [ x, rank, seed ] = mono_upto_random ( m, n, seed )

%*****************************************************************************80
%
%% MONO_UPTO_RANDOM: random monomial with total degree less than or equal to N.
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
%    Input, integer N, the degree.
%    0 <= N.
%
%    Input, integer SEED, the random number seed.
%
%    Output, integer X(M), the random monomial.
%
%    Output, integer RANK, the rank of the monomial.
%
%    Output, integer SEED, the updated random number seed.
%
  rank_min = 1;
  rank_max = mono_upto_enum ( m, n );
  [ rank, seed ] = i4_uniform_ab ( rank_min, rank_max, seed );
  x = mono_unrank_grlex ( m, rank );

  return
end
