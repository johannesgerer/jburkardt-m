function sir_area_display ( sir )

%*****************************************************************************80
%
%% SIR_AREA_DISPLAY displays an area plot of the SIR data.
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
%    Input, integer SIR(3,T_MAX), the percentages of susceptible,
%    infected, and recovered patients for each day.
%
  h = area ( sir' );

  set ( h(1), 'FaceColor', [ 0.0, 1.0, 0.0 ] );
  set ( h(2), 'FaceColor', [ 1.0, 0.0, 0.0 ] );
  set ( h(3), 'FaceColor', [ 0.8, 0.8, 0.8 ] );

  title ( 'Suscepible (Green) Infected (Red) Recovered (Gray)' );

  return
end
