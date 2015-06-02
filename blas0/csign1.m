function value = csign1 ( z1, z2 )

%*****************************************************************************80
%
%% CSIGN1 is a complex transfer-of-sign function.
%
%  Discussion:
%
%    The L1 norm is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, complex Z1, Z2, the arguments.
%
%    Output, complex VALUE,  a complex value, with the magnitude of
%    Z1, and the argument of Z2.
%
  if ( cabs1 ( z2 ) == 0.0 )
    value = 0.0;
  else
    value = cabs1 ( z1 ) * ( z2 / cabs1 ( z2 ) );
  end

  return
end
