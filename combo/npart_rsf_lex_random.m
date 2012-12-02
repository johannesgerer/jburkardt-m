function [ a, seed ] = npart_rsf_lex_random ( n, npart, seed )

%*****************************************************************************80
%
%% NPART_RSF_LEX_RANDOM returns a random RSF NPART partition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.
%
  npartitions = npart_enum ( n, npart );

  [ rank, seed ] = i4_uniform ( 1, npartitions, seed );

  a = npart_rsf_lex_unrank ( rank, n, npart );

  return
end
