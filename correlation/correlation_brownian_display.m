function correlation_brownian_display ( )

%*****************************************************************************80
%
%% CORRELATION_BROWNIAN_DISPLAY displays 4 slices of the Brownian Correlation.
%
%  Discussion:
%
%    The correlation function is C(S,T) = sqrt ( min ( s, t ) / max ( s, t ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2012
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 101;
  s = [ 0.25, 1.5, 2.5, 3.75 ];
  t = linspace ( 0.0, 5.0, n );
  rho0 = 1.0;

  c = correlation_brownian ( m, n, s, t, rho0 );

  hold on

  for i = 1 : m
    plot ( t, c(i,:), 'LineWidth', 3 ); 
  end

  grid on 
  title ( 'Brownian correlation, C(S,T), S = 0.25, 1.5, 2.5, 3.75' )

  hold off

  return
end
