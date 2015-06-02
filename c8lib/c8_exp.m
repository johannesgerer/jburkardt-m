function value = c8_exp ( c )

%*****************************************************************************80
%
%% C8_EXP evaluates the exponential of a C8.
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
%    Input, complex C, the argument.
%
%    Output, complex VALUE, the function value.
%
  cr = c8_real ( c );
  ci = c8_imag ( c );

  value = exp ( cr ) * ( cos ( ci ) + sin ( ci ) * i );

  return
end
