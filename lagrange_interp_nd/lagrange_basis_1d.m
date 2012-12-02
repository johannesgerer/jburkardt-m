function lb = lagrange_basis_1d ( nd, xd, ni, xi ) 

%*****************************************************************************80
%
%% LAGRANGE_BASIS_1D evaluates a 1D Lagrange basis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND,1), the interpolation nodes.
%
%    Input, integer NI, the number of evaluation points.
%
%    Input, real XI(NI,1), the evaluation points.
%
%    Output, real LB(NI,ND), the value, at the I-th point XI, of the
%    Jth basis function.
%
  lb = zeros ( ni, nd );
  
  for i = 1 : ni
    for j = 1 : nd
      lb(i,j) = prod ( ( xi(i) - xd(1:j-1)  ) ./ ( xd(j) - xd(1:j-1)  ) ) ...
              * prod ( ( xi(i) - xd(j+1:nd) ) ./ ( xd(j) - xd(j+1:nd) ) );
    end
  end

  return
end
