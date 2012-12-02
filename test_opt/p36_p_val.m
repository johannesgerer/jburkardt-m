function [ b, m1, m2, r11, r12, r21, r22, seed ] = p36_p_val ( ...
  action, b, m1, m2, r11, r12, r21, r22, seed )

%*****************************************************************************80
%
%% P36_P_VAL sets or gets parameters for problem 36.
%
%  Discussion:
%
%    If ACTION is 'SET', the parameters are input values, and set
%    the internal values.
%
%    If ACTION is 'GET', the parametrs are output values, copied from
%    the internal values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION, specifies the action desired.
%    'SET' sets the parameters;
%    'GET' gets the current values.
%
%    Input/output, real B, M1, M2, R11, R12, R21, R22,
%    problem parameters.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
  persistent b_save
  persistent m1_save
  persistent m2_save
  persistent r11_save
  persistent r12_save
  persistent r21_save
  persistent r22_save
  persistent seed_save

  if ( action(1) == 'G' || action(1) == 'g' )

    b = b_save;
    m1 = m1_save;
    m2 = m2_save;
    r11 = r11_save;
    r12 = r12_save;
    r21 = r21_save;
    r22 = r22_save;
    seed = seed_save;

  elseif ( action(1) == 'S' || action(1) == 's' )

    b_save = b;
    m1_save = m1;
    m2_save = m2;
    r11_save = r11;
    r12_save = r12;
    r21_save = r21;
    r22_save = r22;
    seed_save = seed;

  end

  return
end
