function [ x, seed ] = uniform_01_order_sample ( n, seed )

%*****************************************************************************80
%
%% UNIFORM_01_ORDER_SAMPLE samples the Uniform 01 Order PDF.
%
%  Discussion:
%
%    In effect, this routine simply generates N samples of the
%    Uniform 01 PDF; but it generates them in order.  (Actually,
%    it generates them in descending order, but stores them in
%    the array in ascending order).  This saves the work of
%    sorting the results.  Moreover, if the order statistics
%    for another PDF are desired, and the inverse CDF is available,
%    then the desired values may be generated, presorted, by
%    calling this routine and using the results as input to the
%    inverse CDF routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 168.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the sample.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), N samples of the Uniform 01 PDF, in
%    ascending order.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  v = 1.0;
  for i = n : -1 : 1
    [ u, seed ] = r8_uniform_01 ( seed );
    v = v * u^( 1.0 / i );
    x(i) = v;
  end

  return
end
