function sir_line_display ( t_max, sir )

%*****************************************************************************80
%
%% SIR_LINE_DISPLAY displays a line plot of the SIR data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dianne O'Leary,
%    Models of Infection: Person to Person,
%    Computing in Science and Engineering,
%    Volume 6, Number 1, January/February 2004.
%
%    Dianne OLeary,
%    Scientific Computing with Case Studies,
%    SIAM, 2008,
%    ISBN13: 978-0-898716-66-5,
%    LC: QA401.O44.
%
%  Parameters:
%
%    Input, integer T_MAX, the number of days of data.
%
%    Input, integer SIR(3,T_MAX), the percentages of susceptible,
%    infected, and recovered patients for each day.
%
  t = 1 : t_max;
  
  plot ( t, sir(1,:), 'g', ...
         t, sir(2,:), 'r', ...
         t, sir(3,:), 'k', ...
         'LineWidth', 2 );

  title ( 'Suscepible (Green) Infected (Red) Recovered (Black)' );

  return
end
