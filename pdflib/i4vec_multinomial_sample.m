function ix = i4vec_multinomial_sample ( n, p, ncat )

%*****************************************************************************80
%
%% I4VEC_MULTINOMIAL_SAMPLE generates a multinomial random deviate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Luc Devroye,
%    Non-Uniform Random Variate Generation,
%    Springer, 1986,
%    ISBN: 0387963057,
%    LC: QA274.D48.
%
%  Parameters:
%
%    Input, integer N, the number of events, which will be
%    classified into one of the NCAT categories.
%
%    Input, real P(NCAT).  P(I) is the probability that an event
%    will be classified into category I.  Thus, each P(I) must be between
%    0.0 and 1.0.  
%
%    Input, integer NCAT, the number of categories.
%
%    Output, integer IX(NCAT), a random observation from
%    the multinomial distribution.  All IX(i) will be nonnegative and their
%    sum will be N.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  N < 0\n' );
    error ( 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
  end

  if ( ncat <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  NCAT <= 1\n' );
    error ( 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
  end

  do i = 1, ncat

    if ( p(i) < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
      fprintf ( 1, '  Some P(i) < 0.\n' );
      error ( 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
    end

    if ( 1.0 < p(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
      fprintf ( 1, '  Some 1 < P(i).\n' );
      error ( 'I4VEC_MULTINOMIAL_SAMPLE - Fatal error!\n' );
    end

  end
%
%  Initialize variables.
%
  ntot = n;
  ptot = 1.0;
  ix = zeros ( ncat, 1 );
%
%  Generate the observation.
%
  for icat = 1 : ncat - 1
    prob = p(icat) / ptot;
    ix(icat) = i4_binomial_sample ( ntot, prob );
    ntot = ntot - ix(icat);
    if ( ntot <= 0 )
      return
    end if
    ptot = ptot - p(icat);
  end

  ix(ncat) = ntot;

  return
end
