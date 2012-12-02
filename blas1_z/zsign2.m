function value = zsign2 ( z1, z2 )

%*****************************************************************************80
%
%% ZSIGN2 is a complex transfer-of-sign function.
%
%  Discussion:
%
%    The L2 norm is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
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
  if ( zabs2 ( z2 ) == 0.0 )
    value = 0.0;
  else
    value = zabs2 ( z1 ) * ( z2 / zabs2 ( z2 ) );
  end

  return
end
