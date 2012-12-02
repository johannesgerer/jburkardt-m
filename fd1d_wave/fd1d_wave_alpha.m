function alpha = fd1d_wave_alpha ( x_num, x1, x2, t_num, t1, t2, c )

%*****************************************************************************80
%
%% FD1D_WAVE_ALPHA computes ALPHA for the 1D wave equation.
%
%  Discussion:
%
%    The explicit timestepping procedure uses the quantity ALPHA, which
%    is determined by this function.
%
%    If the spatial region bounds are X1 <= X <= X2, containing X_NUM equally
%    spaced nodes, including the endpoints, and the time domain similarly
%    extends from T1 <= T <= T2 containing T_NUM equally spaced time values,
%    then
%
%      ALPHA = C * DT / DX
%            = C * ( ( T2 - T1 ) / ( T_NUM - 1 ) )
%                / ( ( X2 - X1 ) / ( X_NUM - 1 ) ).
%
%    For a stable computation, it must be the case that ALPHA < 1.
%
%    If ALPHA is greater than 1, then the middle coefficient 1-C^2 DT^2 / DX^2 
%    is negative, and the sum of the magnitudes of the three coefficients becomes 
%    unbounded.  In such a case, the user must reduce the time step size 
%    appropriately.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Second Edition,
%    Prentice Hall, 1999,
%    ISBN: 0-13-012641-1,
%    LC: QA297.P45.
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes in the X direction.
%
%    Input, real X1, X2, the first and last X coordinates.
%
%    Input, integer T_NUM, the number of time steps, including the 
%    initial condition.
%
%    Input, real T1, T2, the first and last T coordinates.
%
%    Input, real C, a parameter which gives the speed of waves.
%
%    Output, real ALPHA, the stability coefficient.
%
  t_delta = ( t2 - t1 ) / ( t_num - 1 );
  x_delta = ( x2 - x1 ) / ( x_num - 1 );
  alpha = c * t_delta / x_delta;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Stability condition ALPHA = C * DT / DX = %f\n', alpha );

  if ( 1.0 < abs ( alpha ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FD1D_WAVE_ALPHA - Warning!\n' );
    fprintf ( 1, '  The stability condition |ALPHA| <= 1 fails.\n' );
    fprintf ( 1, '  Computed results are liable to be inaccurate.\n' );
  end

  return
end
