function value = r8_gamma_sample ( a, r )

%*****************************************************************************80
%
%% R8_GAMMA_SAMPLE generates a Gamma random deviate.
%
%  Discussion:
%
%    This procedure generates random deviates from the gamma distribution whose
%    density is (A^R)/Gamma(R) * X^(R-1) * Exp(-A*X)
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
%    Joachim Ahrens, Ulrich Dieter,
%    Generating Gamma Variates by a Modified Rejection Technique,
%    Communications of the ACM,
%    Volume 25, Number 1, January 1982, pages 47-54.
%
%    Joachim Ahrens, Ulrich Dieter,
%    Computer Methods for Sampling from Gamma, Beta, Poisson and
%    Binomial Distributions,
%    Computing,
%    Volume 12, Number 3, September 1974, pages 223-246.
%
%  Parameters:
%
%    Input, real A, the rate parameter.
%
%    Input, real R, the shape parameter.
%
%    Output, real VALUE, a random deviate 
%    from the distribution.
%
  value = r8_gamma_01_sample ( r ) / a;

  return
end