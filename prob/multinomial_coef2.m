function ncomb = multinomial_coef2 ( nfactor, factor )

%*****************************************************************************80
%
%% MULTINOMIAL_COEF2 computes a Multinomial coefficient.
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
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NFACTOR, the number of factors.
%    1 <= NFACTOR.
%
%    Input, integer FACTOR(NFACTOR), contains the factors.
%    0.0 <= FACTOR(I).
%
%    Output, integer NCOMB, the value of the multinomial coefficient.
%
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
