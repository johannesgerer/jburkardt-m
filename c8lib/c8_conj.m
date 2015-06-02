function value = c8_conj ( z )

%*****************************************************************************80
%
%% C8_CONJ evaluates the conjugate of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
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
  value = c8_real ( z ) - i * c8_imag ( z );

  return
end
