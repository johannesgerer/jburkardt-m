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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values desired.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N,1), a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
%  Local parameters:
%
%    Local, real R(N+1), is used to store some uniform random values.
%    Its dimension is N+1, but really it is only needed to be the
%    smallest even number greater than or equal to N.
%
%    Local, integer X_LO_INDEX, X_HI_INDEX, records the range of entries of
%    X that we need to compute.  This starts off as 1:N, but is adjusted
%    if we have a saved value that can be immediately stored in X(1),
%    and so on.
%
  x = zeros ( n, 1 );
%
%  Record the range of X we need to fill in.
%
  x_lo_index = 1;
  x_hi_index = n;
%
%  If we need just one new value, do that here to avoid null arrays.
%
  if ( x_hi_index - x_lo_index + 1 == 1 )

    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    x(x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1) ) ) * cos ( 2.0 * pi * r(2) );
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
%
%  If we require an odd number of values, we generate an even number,
%  and handle the last pair specially.
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

  end

  return
end
