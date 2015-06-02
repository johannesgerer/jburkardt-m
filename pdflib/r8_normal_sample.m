function value = r8_normal_sample ( av, sd )

%*****************************************************************************80
%
%% R8_NORMAL_SAMPLE generates a normal random deviate.
%
%  Discussion:
%
%    This procedure generates a single random deviate from a normal distribution
%    with mean AV, and standard deviation SD.
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
%    Extensions of Forsythe's Method for Random
%    Sampling from the Normal Distribution,
%    Mathematics of Computation,
%    Volume 27, Number 124, October 1973, page 927-937.
%
%  Parameters:
%
%    Input, real AV, the mean.
%
%    Input, real SD, the standard deviation.
%
%    Output, real VALUE, a random deviate 
%    from the distribution.
%
  value = sd * r8_normal_01_sample ( ) + av;

  return
end
