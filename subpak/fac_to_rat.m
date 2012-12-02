function [ itop, ibot ] = fac_to_rat ( nprime, npower )

%*****************************************************************************80
%
%% FAC_TO_RAT converts a prime factorization into a rational value.
%
%  Example:
%
%    Start with the prime factorization representation:
%
%      40/9 = 2**3 * 3**(-2) * 5
%
%    Input:
%
%      NPOWER = ( 3, -2, 1 )
%
%    Output:
%
%      ITOP = 40 ( = 2**3 * 5**1 = PRIME(1)**3                 * PRIME(3)**1 )
%      IBOT = 9  ( = 3**2        =               PRIME(2)**2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NPRIME, the index of the highest prime number
%    used in the representations.
%
%    Input, integer NPOWER(NPRIME).  NPOWER(I) is the power of
%    the I-th prime in the prime factorization.  NPOWER(I) may
%    be positive or negative.
%
%    Output, integer ITOP, IBOT, the top and bottom of a rational value.
%
  itop = 1;
  ibot = 1;
  for i = 1 : nprime
    if ( 0 < npower(i) )
      itop = itop * prime(i)^npower(i);
    elseif ( npower(i) < 0 )
      ibot = ibot * prime(i)^(-npower(i));
    end
  end

  return
end
