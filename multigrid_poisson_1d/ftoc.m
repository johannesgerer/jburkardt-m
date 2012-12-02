function [ uc, rc ] = ftoc ( nf, uf, rf, nc )

%*****************************************************************************80
%                                                    
%% FTOC transfers data from a fine grid to a coarser grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Hager,
%    Applied Numerical Linear Algebra,
%    Prentice-Hall, 1988,
%    ISBN13: 978-0130412942,
%    LC: QA184.H33.
%
%  Parameters:
%
%    Input, integer NF, the number of fine nodes.
%
%    Input, real UF(NF), the fine data.
%
%    Input, real RF(NF), the right hand side for the fine grid.
%
%    Input, integer NC, the number of coarse nodes.
%
%    Output, real UC(NC), the coarse grid data, set to zero.
%
%    Output, real RC(NC), the right hand side for the coarse grid.
%
  uc = zeros ( nc, 1 );

  rc = zeros ( nc, 1 );

  rc(2:nc-1,1) = 4.0 * ( rf(3:2:2*nc-3,1) ...
    + uf(2:2:2*nc-4,1) - 2.0 * uf(3:2:2*nc-3,1) + uf(4:2:2*nc-2,1) );

  return
end
