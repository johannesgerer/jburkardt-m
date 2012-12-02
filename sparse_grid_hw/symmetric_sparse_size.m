function nr2 = symmetric_sparse_size ( nr, dim, nodes, x0 )

%*****************************************************************************80
%
%% SYMMETRIC_SPARSE_SIZE sizes a symmetric sparse rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2012
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Florian Heiss, Viktor Winschel,
%    Likelihood approximation by numerical integration on sparse grids,
%    Journal of Econometrics,
%    Volume 144, 2008, pages 62-80.
%
%  Parameters:
% 
%    Input, integer DIM, the dimension.
%
%    Input, integer NR, the dimension of the rule in the 
%    positive orthant.
%
%    Input, real NODES(NR,DIM), the nodes for the positive orthant.
%
%    Input, real X0, the point of symmetry for the 1D rule, 
%    typically 0.
%
%    Output, integer NR2, the dimension of the rule when "unfolded" to the 
%    full space.
%

%
%  Count the size of the full rule.
%
  nr2 = 0;

  for r = 1 : nr
    count = 1;
    for j = 1 : dim
      if ( nodes(r,j) ~= x0 )
        count = 2 * count;
      end
    end
    nr2 = nr2 + count;
  end

  return
end
