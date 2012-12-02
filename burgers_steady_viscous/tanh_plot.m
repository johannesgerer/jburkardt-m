function tanh_plot ( )

%*****************************************************************************80
%
%% TANH_PLOT makes a plot of certain tanh() functions.
%
%  Discussion:
%
%    The value is +1 if the number is positive or zero, and it is -1 otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
%
%  Author:
%
%    John Burkardt
%
  m = 101;
  x = ( linspace ( -1.0, +1.0, m ) )';

  u = zeros ( m, 6 );
  for j = 0 : 5
    s = 2^j;
    u(:,j+1) = tanh ( s * x(:) / 2.0 ) / ( tanh ( s * -1.0 / 2.0 ) );
  end

  plot ( x, u, 'Linewidth', 3 )
  grid on
  axis ( [-1, +1, -1.1, +1.1 ] )
  xlabel ( '<--- X --->' )
  ylabel ( '<--- U(X) ---> ' )
  title ( 'tanh ( 2^J * x / 2.0 ), J = 0, 1, ..., 5 scaled to be +1 at -1' )

  return
end
