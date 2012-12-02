function ode_display ( bVals, kVals, peakVals )

%*****************************************************************************80
%
%% ODE_DISPLAY displays the results of the ODE_FUN sweep.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real bVals(M), kVals(N), the values of B and K for which
%    the ODE was solved.
%
%    Input, real peakVals(M,N), the maximum value of the ODE solution for
%    a given pair of K and B values.
%    
  figure ( 1 );

  surf ( bVals, kVals, peakVals, 'EdgeColor', 'Interp', 'FaceColor', 'Interp' );

  title ( 'Results of ODE Parameter Sweep' )

  xlabel ( 'Damping B' );
  ylabel ( 'Stiffness K' );
  zlabel ( 'Peak Displacement' );

  view ( 50, 30 )

  filename = 'ode_display.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
