function value = i4_characteristic ( q )

%*****************************************************************************80
%
%% I4_CHARACTERISTIC gives the characteristic for an integer.
%
%  Discussion:
%
%    For any positive integer Q, the characteristic is:
%
%    Q, if Q is a prime;
%    P, if Q = P**N for some prime P and some integer N;
%    0, otherwise, that is, if Q is negative, 0, 1, or the product
%       of more than one distinct prime.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2005
%
%  Author:
%
%    FORTRAN77 original version by Bratley, Fox, Niederreiter.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Harald Niederreiter,
%    Algorithm 738:
%    Programs to Generate Niederreiter's Low-Discrepancy Sequences,
%    ACM Transactions on Mathematical Software,
%    Volume 20, Number 4, pages 494-495, 1994.
%
%  Parameters:
%
%    Input, integer Q, the value to be tested.
%
%    Output, integer VALUE, the characteristic of Q.
%
  if ( q <= 1 )
    value = 0;
    return
  end
%
%  If Q is not prime, then there is at least one prime factor
%  of Q no greater than SQRT(Q)+1.
%
%  A faster code would only consider prime values of I,
%  but that entails storing a table of primes and limiting the
%  size of Q.  Simplicity and flexibility for now!
%
  i_max = floor ( sqrt ( q ) ) + 1;

  for i = 2 : i_max

    if ( mod ( q, i ) == 0 )

      while ( mod ( q, i ) == 0 )
        q = q / i;
      end

      if ( q == 1 )
        value = i;
      else
        value = 0;
      end

      return

    end

  end
%
%  If no factor was found, then Q is prime.
%
  value = q;

  return
end
