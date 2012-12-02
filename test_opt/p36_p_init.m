function seed = p36_p_init ( seed )

%*****************************************************************************80
%
%% P36_P_INIT initializes parameters for problem 36.
%
%  Discussion:
%
%    This routine can be called to choose values for the parameters at random.
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
%    Input/output, integer SEED, a seed for the random number generator.
%
  [ m1, seed ]  = r8_uniform ( 0.0, 100.0, seed );
  [ m2, seed ]  = r8_uniform ( 0.0, 100.0, seed );
  [ b, seed ]   = r8_uniform ( 0.0, 10.0,  seed );
  [ r11, seed ] = r8_uniform ( 0.0, b,     seed );
  [ r12, seed ] = r8_uniform ( b,   10.0,  seed );
  [ r21, seed ] = r8_uniform ( 0.0, 10.0,  seed );
  [ r22, seed ] = r8_uniform ( 0.0, 10.0,  seed );

  p36_p_set ( b, m1, m2, r11, r12, r21, r22, seed );

  return
end
