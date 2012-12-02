function [ value, jsr ] = r4_uni ( jsr )

%*****************************************************************************80
%
%% R4_UNI returns a uniformly distributed real value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2008
%
%  Author:
%
%    Original C version by George Marsaglia, Wai Wan Tsang
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    George Marsaglia, Wai Wan Tsang,
%    The Ziggurat Method for Generating Random Variables,
%    Journal of Statistical Software,
%    Volume 5, Number 8, October 2000, seven pages.
%
%  Parameters:
%
%    Input, integer JSR, the seed.
%
%    Output, real VALUE, a uniformly distributed random value in
%    the range [0,1].
%
%    Output, integer JSR, the updated seed.
%
  [ jz, jsr ] = shr3 ( jsr );

  value = 0.5 + 0.2328306E-09 * double ( jz );

  if ( 1.0 < value )
    value = value - 1.0;
  end

  return
end
