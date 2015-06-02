function value = c8_atan ( z )

%*****************************************************************************80
%
%% C8_ATAN evaluates the inverse tangent of a C8.
%
%  Discussion:
%
%    A C8 is a complex ( kind = 8 ) value.
%
%    Here we use the relationship:
%
%      C8_ATAN ( Z ) = ( i / 2 ) * log ( ( 1 - i * z ) / ( 1 + i * z ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2015
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
  arg = ( 1.0 - i * z ) / ( 1.0 + i * z );

  value = 0.5 * i * c8_log ( arg );

  return
end
