function value = r4_randgs ( xmean, sd )

%*****************************************************************************80
%
%% R4_RANDGS generates a normally distributed random number.
%
%  Discussion:
%
%    This function generate a normally distributed random number, that is,
%    it generates random numbers with a Gaussian distribution.  These
%    random numbers are not exceptionally good, especially in the tails
%    of the distribution, but this implementation is simple and suitable
%    for most applications.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Richard Hamming,
%    Numerical Methods for Scientists and Engineers,
%    Dover, 1986,
%    ISBN: 0486652416,
%    LC: QA297.H28.
%
%  Parameters:
%
%    Input, real XMEAN, the mean of the Gaussian distribution.
%
%    Input, real SD, the standard deviation of the
%    Gaussian function.
%
%    Output, real VALUE, a normally distributed random number.
%
  value = - 6.0;
  for i = 1 : 12
    value = value + r4_rand ( 0.0 );
  end

  value = xmean + sd * value;

  return
end
