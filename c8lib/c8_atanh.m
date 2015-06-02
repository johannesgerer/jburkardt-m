function value = c8_atanh ( z )

%*****************************************************************************80
%
%% C8_ATANH evaluates the inverse hyperbolic tangent of a C8.
%
%  Discussion:
%
%    A C8 is a complex ( kind = 8 ) value.
%
%    Here we use the relationship:
%
%      C8_ATANH ( Z ) = - i * C8_ATAN ( i * Z ).
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
  value = - i * c8_atan ( i * z );

  return
end
