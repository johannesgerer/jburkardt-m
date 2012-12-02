function [ an, bn ] = lcrg_anbn ( a, b, c, n )

%*****************************************************************************80
%
%% LCRG_ANBN computes the "N-th power" of a linear congruential generator.
%
%  Discussion:
%
%    We are considering a linear congruential random number generator.
%    The LCRG takes as input an integer value called SEED, and returns
%    an updated value of SEED,
%
%      SEED(out) = ( a * SEED(in) + b ) mod c.
%
%    and an associated pseudorandom real value
%
%      U = SEED(out) / c.
%
%    In most cases, a user is content to call the LCRG repeatedly, with
%    the updating of SEED being taken care of automatically.
%
%    The purpose of this routine is to determine the values of AN and BN
%    that describe the LCRG that is equivalent to N applications of the
%    original LCRG.
%
%    One use for such a facility would be to do random number computations
%    in parallel.  If each of N processors is to compute many random values,
%    you can guarantee that they work with distinct random values
%    by starting with a single value of SEED, using the original LCRG to generate
%    the first N-1 "iterates" of SEED, so that you now have N "seed" values,
%    and from now on, applying the N-th power of the LCRG to the seeds.
%
%    If the K-th processor starts from the K-th seed, it will essentially
%    be computing every N-th entry of the original random number sequence,
%    offset by K.  Thus the individual processors will be using a random
%    number stream as good as the original one, and without repeating, and
%    without having to communicate.
%
%    To evaluate the N-th value of SEED directly, we start by ignoring
%    the modular arithmetic, and working out the sequence of calculations
%    as follows:
%
%      SEED(0)   =     SEED.
%      SEED(1)   = a * SEED      + b
%      SEED(2)   = a * SEED(1)   + b = a^2 * SEED           + a * b + b
%      SEED(3)   = a * SEED(2)   + b = a^3 * SEED + a^2 * b + a * b + b
%      ...
%      SEED(N-1) = a * SEED(N-2) + b
%
%      SEED(N) = a * SEED(N-1) + b = a^N * SEED
%                                    + ( a^(n-1) + a^(n-2) + ... + a + 1 ) * b
%
%    or, using the geometric series,
%
%      SEED(N) = a^N * SEED + ( a^N - 1) / ( a - 1 ) * b
%              = AN * SEED + BN
%
%    Thus, from any SEED, we can determine the result of N applications of the
%    original LCRG directly if we can solve
%
%      ( a - 1 ) * BN = ( a^N - 1 ) * b in modular arithmetic,
%
%    and evaluate:
%
%      AN = a^N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Barry Wilkinson, Michael Allen,
%    Parallel Programming:
%    Techniques and Applications Using Networked Workstations and Parallel Computers,
%    Prentice Hall,
%    ISBN: 0-13-140563-2,
%    LC: QA76.642.W54.
%
%  Parameters:
%
%    Input, integer A, the multiplier for the LCRG.
%
%    Input, integer B, the added value for the LCRG.
%
%    Input, integer C, the base for the modular arithmetic.
%    For 32 bit arithmetic, this is often 2^31 - 1, or 2147483647.  It is
%    required that 0 < C.
%
%    Input, integer N, the "index", or number of times that the
%    LCRG is to be applied.  It is required that 0 <= N.
%
%    Output, integer AN, BN, the multiplier and added value for
%    the LCRG that represent N applications of the original LCRG.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCRG_ANBN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of N = %d\n', n );
    error ( 'LCRG_ANBN - Fatal error!' );
  end

  if ( c <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCRG_ANBN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of C = %d\n', c );
    error ( 'LCRG_ANBN - Fatal error!' );
  end

  if ( n == 0 )
    an = 1;
    bn = 0;
  elseif ( n == 1 )
    an = a;
    bn = b;
  else
%
%  Compute A^N.
%
    an = power_mod ( a, n, c );
%
%  Solve
%    ( a - 1 ) * BN = ( a^N - 1 ) mod B
%  for BN.
%
    am1 = a - 1;
    anm1tb = ( an - 1 ) * b;

    [ bn, ierror ] = congruence ( am1, c, anm1tb );

    if ( ierror ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LCRG_ANBN - Fatal error!\n' );
      fprintf ( 1, '  An error occurred in the CONGRUENCE routine.\n' );
      fprintf ( 1, '  The error code was IERROR = %d\n', ierror );
      error ( 'LCRG_ANGN - Fatal error!' );
    end

  end

  return
end
