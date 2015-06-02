function [ x, seed ] = i4_normal_ab ( a, b, seed )

%*****************************************************************************80
%
%% I4_NORMAL_AB returns a scaled pseudonormal I4.
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
%    Input, real A, the mean of the normal PDF.
%
%    Input, real B, the standard deviation of the normal PDF.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ x, seed ] = r4_normal_01 ( seed );

  x = round ( a + b * x );

  return
end
