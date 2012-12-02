function [ b, m1, m2, r11, r12, r21, r22, seed ] = p36_p_get (  )

%*****************************************************************************80
%
%% P36_P_GET gets the values of the parameters for problem 36.
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
%    Output, real B, M1, M2, R11, R12, R21, R22,
%    problem parameters.
%
%    Output, integer SEED, a seed for the random number generator.
%
  b = 0.0;
  m1 = 0;
  m2 = 0;
  r11 = 0.0;
  r12 = 0.0;
  r21 = 0.0;
  r22 = 0.0;
  seed = 0;

  [ b, m1, m2, r11, r12, r21, r22, seed ] = ...
    p36_p_val ( 'GET', b, m1, m2, r11, r12, r21, r22, seed );

  return
end
