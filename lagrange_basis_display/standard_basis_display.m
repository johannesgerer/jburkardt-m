function standard_basis_display ( a, b, m )

%*****************************************************************************80
%
%% STANDARD_BASIS_DISPLAY displays the standard monomial basis "vectors".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the limits of the interval.  Typically 0 and 1.
%
%    Input, integer M, the maximum polynomial degree.
%    0 <= M.
%
  x = linspace ( a, b, 501 );

  figure ( 1 )

  clf

  hold on

  for i = 0 : m
    y = x.^i;
    plot ( x, y, 'Linewidth', 2 );    
  end

  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<--B(I;X)--->' );
  title ( sprintf ( 'Standard monomial basis functions 0 through %d', m ) );

  hold off

  filename = sprintf ( 'standard_%d.png', m );

  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Standard basis plot saved as "%s".\n', filename );

  return
end
