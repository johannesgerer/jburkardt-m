function [ value, x ] = randlc ( x )

%*****************************************************************************80
%
%% RANDLC returns a uniform pseudorandom value.
%
%  Discussion:
%
%    The number returned is in the range (0, 1).  
%
%    The algorithm uses the linear congruential generator:
%
%      X(K+1) = A * X(K)  mod 2^46
%
%    This scheme generates 2^44 numbers before repeating.  
%
%    A suggested value for A is 5^13 = 1220703125.
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
%    Input, integer X, the current seed.  X should be an odd integer such that 
%    1 <= A <= 2^46.
%
%    Output, real VALUE, the next pseudorandom value.
%
%    Output, integer X, the updated seed.
%
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
  a = 1220703125.0;

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
%
%  Break A into two parts such that A = 2^23 * A1 + A2.
%
    t1 = r23 * a;
    a1 = floor ( t1 );
    a2 = a - t23 * a1;

    ks = 1;

  end
%
%  Deal with a 0 input value of X.
%
  if ( x == 0.0 )
    x = 314159265.0;
  end
%
%  Deal somewhat arbitrarily with negative input X.
%
  if ( x < 0.0 )
    x = - x;
  end
%
%  Break X into two parts X1 and X2 such that:
%
%    X = 2^23 * X1 + X2, 
%
%  then compute
%
%    Z = A1 * X2 + A2 * X1  (mod 2^23)
%    X = 2^23 * Z + A2 * X2  (mod 2^46).
%
  t1 = r23 * x;
  x1 = floor ( t1 );
  x2 = x - t23 * x1;

  t1 = a1 * x2 + a2 * x1;
  t2 = floor ( r23 * t1 );
  z = t1 - t23 * t2;

  t3 = t23 * z + a2 * x2;
  t4 = floor ( r46 * t3 );
  x = t3 - t46 * t4;

  value = r46 * x;

  return
end
