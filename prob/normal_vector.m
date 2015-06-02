function [ x, seed ] = normal_vector ( n, x_mean, x_dev, seed )

%*****************************************************************************80
%
%% NORMAL_VECTOR samples the normal probability distribution.
%
%  Discussion:
%
%    The normal probability distribution function (PDF) has
%    a user-specified mean and standard deviation.
%
%    This routine can generate a vector of values on one call.  It
%    has the feature that it should provide the same results
%    in the same order no matter how we break up the task.
%
%    Before calling this routine, the user may call RANDOM_SEED
%    in order to set the seed of the random number generator.
%
%    The Box-Muller method is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values desired.
%
%    Input, real X_MEAN, the desired mean value.
%
%    Input, real X_DEV, the desired standard deviation.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ y(1:n), seed ] = normal_01_vector ( n, seed );

  x(1:n) = x_mean + x_dev * y(1:n);

  return
end
