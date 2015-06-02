function [ x, rank, seed ] = mono_between_random ( m, n1, n2, seed )

%*****************************************************************************80
%
%% MONO_BETWEEN_RANDOM: random monomial with total degree between N1 and N2.
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
%    Input, integer N1, N2, the minimum and maximum degrees.
%    0 <= N1 <= N2.
%
%    Input, integer SEED, the random number seed.
%
%    Output, integer X(M), the random monomial.
%
%    Output, integer RANK, the rank of the monomial.
%
%    Output, integer SEED, the updated random number seed.
%
  n1_copy = max ( n1, 0 );
  rank_min = mono_upto_enum ( m, n1_copy - 1 ) + 1;
  rank_max = mono_upto_enum ( m, n2 );
  [ rank, seed ] = i4_uniform_ab ( rank_min, rank_max, seed );
  x = mono_unrank_grlex ( m, rank );

  return
end
