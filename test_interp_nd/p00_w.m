function [ w, seed ] = p00_w ( prob, m, seed )

%*****************************************************************************80
%
%% P00_W computes a random W parameter vector for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real W(M,1), the W parameter vector.
%
%    Output, integer SEED, the updated seed.
%
  [ w, seed ] = r8vec_uniform_01 ( m, seed );

  return
end
