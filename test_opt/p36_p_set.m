function p36_p_set ( b, m1, m2, r11, r12, r21, r22, seed )

%*****************************************************************************80
%
%% P36_P_SET sets parameters for problem 36.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real B, M1, M2, R11, R12, R21, R22, problem parameters.
%
%    Input, integer SEED, a seed for the random number generator.
%
  p36_p_val ( 'SET', b, m1, m2, r11, r12, r21, r22, seed );

  return
end
