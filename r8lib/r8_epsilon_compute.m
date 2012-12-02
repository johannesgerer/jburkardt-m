function value = r8_epsilon_compute ( )

%*****************************************************************************80
%
%% R8_EPSILON_COMPUTE returns the R8 roundoff unit.
%
%  Discussion:
%
%    The roundoff unit is a number R which is a power of 2 with the 
%    property that, to the precision of the computer's arithmetic,
%      1 < 1 + R
%    but 
%      1 = ( 1 + R / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the roundoff unit.
%
  one = 1;

  value = one;
  temp = value / 2.0;
  test = r8_add ( one, temp );

  while ( one < test )  
    value = temp;
    temp = value / 2.0;
    test = r8_add ( one, temp );
  end

  return
end
