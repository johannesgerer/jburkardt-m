function lp = lagrange_derivative ( nd, xd, ni, xi ) 

%*****************************************************************************80
%
%% LAGRANGE_DERIVATIVE evaluates the derivative of the Lagrange basis polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 November 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND,1), the data nodes.
%
%    Input, integer NI, the number of evaluation points.
%
%    Input, real XI(NI,1), the evaluation points.
%
%    Output, real LP(NI,ND), the value, at the I-th point XI, of the
%    Jth basis function.
%
  lp = zeros ( ni, nd );
  
  for i = 1 : ni
    for j = 1 : nd

      for j1 = 1 : nd

        if ( j1 ~= j )
          p = 1.0;
          for j2 = 1 : nd
            if ( j2 == j1 )
              p = p / ( xd(j) - xd(j2) );
            elseif ( j2 ~= j )
              p = p * ( xi(i) - xd(j2) ) / ( xd(j) - xd(j2) );
            end
          end
          lp(i,j) = lp(i,j) + p;
        end

      end

    end
  end

  return
end
