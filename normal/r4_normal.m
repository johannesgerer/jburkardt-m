function [ x, seed ] = r4_normal ( a, b, seed )

%*****************************************************************************80
%
%% R4_NORMAL returns a scaled pseudonormal R4.
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
%    Input, real A, the mean of the normal PDF.
%
%    Input, real B, the standard deviation of the normal PDF.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  x = a + b * r4_normal_01 ( seed );

  return
end
