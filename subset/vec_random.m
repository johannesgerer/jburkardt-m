function [ a, seed ] = vec_random ( n, base, seed )

%*****************************************************************************80
%
%% VEC_RANDOM selects a random N-vector of integers modulo a given base.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the vector to be generated.
%
%    Input, integer BASE, the base to be used.
%
%    Input, integer SEED, a random number seed.
%
%    Output, integer A(N), a list of N random values between
%    0 and BASE-1.
%
%    Input, integer SEED, an updated random number seed.
%
  for i = 1 : n
    [ a(i), seed ] = i4_uniform ( 0, base-1, seed );
  end

  return
end
