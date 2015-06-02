function value = c8_log ( z )

%*****************************************************************************80
%
%% C8_LOG evaluates the logarithm of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    Here we use the relationship:
%
%      C8_LOG ( Z ) = LOG ( MAG ( Z ) ) + i * ARG ( Z )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z, the argument.
%
%    Output, complex VALUE, the function value.
%
  arg = c8_arg ( z );
  mag = c8_mag ( z );

  value = log ( mag ) + arg * i;
 
  return
end
