function [ x, seed ] = r8vec_normal_01 ( n, seed )

%*****************************************************************************80
%
%% R8VEC_NORMAL_01 samples the standard normal probability distribution.
%
%  Discussion:
%
%    The standard normal probability distribution function (PDF) has
%    mean 0 and standard deviation 1.
%
%    This routine can generate a vector of values on one call.  It
%    has the feature that it should provide the same results
%    in the same order no matter how we break up the task.
%
%    Before calling this routine, the user may call RANDOM_SEED
%    in order to set the seed of the random number generator.
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
%    17 July 2006
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
%  Local parameters:
%
%    Local, integer MADE, records the number of values that have
%    been computed.  On input with negative N, this value overwrites
%    the return value of N, so the user can get an accounting of
%    how much work has been done.
%
%    Local, real R(N+1), is used to store some uniform random values.
%    Its dimension is N+1, but really it is only needed to be the
%    smallest even number greater than or equal to N.
%
%    Local, integer SAVED, is 0 or 1 depending on whether there is a
%    single saved value left over from the previous call.
%
%    Local, integer X_LO_INDEX, X_HI_INDEX, records the range of entries of
%    X that we need to compute.  This starts off as 1:N, but is adjusted
%    if we have a saved value that can be immediately stored in X(1),
%    and so on.
%
%    Local, real Y, the value saved from the previous call, if
%    SAVED is 1.
%
  persistent made;
  persistent saved;
  persistent y;
%
%  I'd like to allow the user to reset the internal data.
%  But this won't work properly if we have a saved value Y.
%  I'm making a crock option that allows the user to signal
%  explicitly that any internal memory should be flushed,
%  by passing in a negative value for N.
%
  if ( n < 0 )
    made = 0;
    saved = 0;
    y = 0.0;
    x = [];
    return
  elseif ( n == 0 )
    x = [];
    return
  end
%
%  Record the range of X we need to fill in.
%
  x_lo_index = 1;
  x_hi_index = n;
%
%  Use up the old value, if we have it.
%
  if ( saved == 1 )
    x(1) = y;
    saved = 0;
    x_lo_index = 2;
  end
%
%  Maybe we don't need any more values.
%
  if ( x_hi_index - x_lo_index + 1 == 0 )
%
%  If we need just one new value, do that here to avoid null arrays.
%
  elseif ( x_hi_index - x_lo_index + 1 == 1 )

    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    x(x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1) ) ) * cos ( 2.0 * pi * r(2) );
    y =      sqrt ( -2.0 * log ( r(1) ) ) * sin ( 2.0 * pi * r(2) );

    saved = 1;

    made = made + 2;
%
%  If we require an even number of values, that's easy.
%
  elseif ( mod ( x_hi_index - x_lo_index + 1, 2 ) == 0 )

    m = floor ( ( x_hi_index - x_lo_index + 1 ) / 2 );

    [ r, seed ] = r8vec_uniform_01 ( 2*m, seed );

    x(x_lo_index:2:x_hi_index-1) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-1) ) ) ...
      .* cos ( 2.0 * pi * r(2:2:2*m) );

    x(x_lo_index+1:2:x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-1) ) ) ...
      .* sin ( 2.0 * pi * r(2:2:2*m) );

    made = made + x_hi_index - x_lo_index + 1;
%
%  If we require an odd number of values, we generate an even number,
%  and handle the last pair specially, storing one in X(N), and
%  saving the other for later.
%
  else

    x_hi_index = x_hi_index - 1;

    m = floor ( ( x_hi_index - x_lo_index + 1 ) / 2 ) + 1;

    [ r, seed ] = r8vec_uniform_01 ( 2*m, seed );

    x(x_lo_index:2:x_hi_index-1) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-3) ) ) ...
      .* cos ( 2.0 * pi * r(2:2:2*m-2) );

    x(x_lo_index+1:2:x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-3) ) ) ...
      .* sin ( 2.0 * pi * r(2:2:2*m-2) );

    x(n) = sqrt ( -2.0 * log ( r(2*m-1) ) ) ...
      * cos ( 2.0 * pi * r(2*m) );

    y = sqrt ( -2.0 * log ( r(2*m-1) ) ) ...
      * sin ( 2.0 * pi * r(2*m) );

    saved = 1;

    made = made + x_hi_index - x_lo_index + 2;

  end

  return
end
