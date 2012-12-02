function p = p25_p_get ( )

%*****************************************************************************80
%
%% P25_P_GET gets the value of a parameter for problem 25.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real P, the value of the parameter that multiplies the
%    Gaussian noise.
%
  p = 0.0;
  p = p25_p_val ( 'GET', p );

  return
end
