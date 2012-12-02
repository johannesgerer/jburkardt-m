function [ value, x ] = randlc_jump ( x, k )

%*****************************************************************************80
%
%% RANDLC_JUMP returns the K-th element of a uniform pseudorandom sequence.
%
%  Discussion:
%
%    The sequence uses the linear congruential generator:
%
%      X(K+1) = A * X(K)  mod 2^46
%
%    The K-th element, which can be represented as
%
%      X(K) = A^K * X(0)  mod 2^46
%
%    is computed directly using the binary algorithm for exponentiation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Bailey, Eric Barszcz, John Barton, D Browning, Robert Carter, 
%    Leonardo Dagum, Rod Fatoohi,
%    Samuel Fineberg, Paul Frederickson, Thomas Lasinski, Robert Schreiber, 
%    Horst Simon, V Venkatakrishnan, Sisira Weeratunga,
%    The NAS Parallel Benchmarks,
%    RNR Technical Report RNR-94-007,
%    March 1994.
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 2, Seminumerical Algorithms,
%    Third Edition,
%    Addison Wesley, 1997,
%    ISBN: 0201896842,
%    LC: QA76.6.K64.
%
%  Parameters:
%
%    Input, uint64 X, the initial seed (with index 0).  
%
%    Input, integer K, the index of the desired value.
%
%    Output, real VALUE, the K-th value in the sequence.
%
%    Output, uint64 X, the K-th seed.
%
  persistent a;
  persistent a1;
  persistent a2;
  persistent ks;
  persistent r23;
  persistent r46;
  persistent t23;
  persistent t46;
%
%  If this is the first call, compute 
%
%    R23 = 2 ^ -23, 
%    R46 = 2 ^ -46,
%    T23 = 2 ^ 23, 
%    T46 = 2 ^ 46.  
%
%  These are computed in loops, rather than by merely using the power operator, 
%  in order to insure that the results are exact on all systems.  
%
  if ( isempty ( ks ) )

    r23 = 1.0;
    r46 = 1.0;
    t23 = 1.0;
    t46 = 1.0;

    for i = 1 : 23
      r23 = 0.5 * r23;
      t23 = 2.0 * t23;
    end

    for i = 1 : 46
      r46 = 0.5 * r46;
      t46 = 2.0 * t46;
    end

    a = 1220703125.0;
%
%  Break A into two parts such that A = 2^23 * A1 + A2.
%
    t1 = r23 * a;
    a1 = floor ( t1 );
    a2 = a - t23 * a1;

    ks = 1;

  end

  if ( k < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'RANDLC_JUMP - Fatal error!\n' );
    fprintf ( 1, '  K < 0.\n' );
    error ( 'RANDLC_JUMP - Fatal error!' )

  elseif ( k == 0 )

%
%  Find M so that K < 2^M.
%
  else

    m = 1;
    twom = 2;
    while ( twom <= k )
      twom = twom * 2;
      m = m + 1;
    end

    b = a;
    b1 = a1;
    b2 = a2;

    for i = 1 : m

      j = floor ( k / 2 );
%
%  Replace X by A * X, if appropriate.
%
      if ( 2 * j ~= k )

        t1 = r23 * x;
        x1 = floor ( t1 );
        x2 = x - t23 * x1;

        t1 = b1 * x2 + b2 * x1;
        t2 = floor ( r23 * t1 );
        z = t1 - t23 * t2;

        t3 = t23 * z + b2 * x2;
        t4 = floor ( r46 * t3 );
        x = t3 - t46 * t4;

      end
%
%  Replace A by A * A mod 2^46.
%
      t1 = r23 * b;
      x1 = floor ( t1 );
      x2 = b - t23 * x1;

      t1 = b1 * x2 + b2 * x1;
      t2 = floor ( r23 * t1 );
      z = t1 - t23 * t2;

      t3 = t23 * z + b2 * x2;
      t4 = floor ( r46 * t3 );
      b = t3 - t46 * t4;
%
%  Update A1, A2.
%
      t1 = r23 * b;
      b1 = floor ( t1 );
      b2 = b - t23 * b1;

      k = j;

    end

  end

  value = r46 * x;

  return
end
