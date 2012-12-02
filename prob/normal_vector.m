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
%  Method:
%
%    The Box-Muller method is used, which is efficient, but
%    generates an even number of values each time.  On any call
%    to this routine, an even number of new values are generated.
%    Depending on the situation, one value may be left over.
%    In that case, it is saved for the next call.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values desired.  If N is negative,
%    then the code will flush its internal memory; in particular,
%    if there is a saved value to be used on the next call, it is
%    instead discarded.  This is useful if the user has reset the
%    random number seed, for instance.
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
