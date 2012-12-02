function lagrange_basis_display ( a, b, m, xd )

%*****************************************************************************80
%
%% LAGRANGE_BASIS_DISPLAY displays the Lagrange interpolation basis "vectors".
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
%    Input, real XD(M+1,1), the interpolation nodes.
%
  xd = xd(:)
  yd = ones ( m + 1, 1 );

  ni = 501;
  xi =  ( linspace ( a, b, ni ) )';

  figure ( 2 )

  clf

  hold on

  for i = 1 : m + 1

    yi(1:ni,1) = 1.0;

    for j = 1 : m + 1

      if ( j ~= i )

        yi(1:ni,1) = yi(1:ni,1) .* ( xi(1:ni,1) - xd(j,1) ) / ( xd(i,1) - xd(j,1) );

      end

    end

    plot ( xi, yi, 'Linewidth', 2 );    

  end

  plot ( xd, yd, 'r.', 'Markersize', 30 );  

  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<--B(I;X)--->' );
  title ( sprintf ( 'Lagrange interpolation basis functions 0 through %d', m ) );

  hold off

  filename = sprintf ( 'lagrange_%d.png', m );

  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lagrange basis plot saved as "%s".\n', filename );

  return
end
