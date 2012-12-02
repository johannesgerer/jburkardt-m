function ncomb = multinomial_coef2 ( nfactor, factor )

%*****************************************************************************80
%
%% MULTINOMIAL_COEF2 computes a multinomial coefficient.
%
%  Discussion:
%
%    The multinomial coefficient is a generalization of the binomial
%    coefficient.  It may be interpreted as the number of combinations of
%    N objects, where FACTOR(1) objects are indistinguishable of type 1,
%    ... and FACTOR(NFACTOR) are indistinguishable of type NFACTOR,
%    and N is the sum of FACTOR(1) through FACTOR(NFACTOR).
%
%    NCOMB = N! / ( FACTOR(1)! FACTOR(2)! ... FACTOR(NFACTOR)! )
%
%    A direct method is used, which should be exact.  However, there
%    is a possibility of intermediate overflow of the result.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NFACTOR, the number of factors.
%
%    Input, integer FACTOR(NFACTOR), contains the factors.
%    0 <= FACTOR(I)
%
%    Output, integer NCOMB, the value of the multinomial coefficient.
%

%
%  Each factor must be nonnegative.
%
  for i = 1 : nfactor

    if ( factor(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MULTINOMIAL_COEF2 - Fatal error\n' );
      fprintf ( 1, '  Factor %d = %d\n', i, factor(i) );
      fprintf ( 1, '  But this value must be nonnegative.\n' );
      error ( 'MULTINOMIAL_COEF2 - Fatal error!' );
    end

  end

  ncomb = 1;
  k = 0;

  for i = 1 : nfactor

    for j = 1 : factor(i)
      k = k + 1;
      ncomb = ( ncomb * k ) / j;
    end

  end

  return
end
