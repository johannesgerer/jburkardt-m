function uf = ctof ( nc, uc, nf, uf )

%*****************************************************************************80
%                                                    
%% CTOF transfers data from a coarse to a finer grid.
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
%    Input, integer NC, the number of coarse nodes.
%
%    Input, real UC(NC,1), the coarse correction data.
%
%    Input, integer NF, the number of fine nodes.
%
%    Input/output, real UF(NF,1), on input, the fine grid data.
%    On output, the data has been updated with prolonged coarse 
%    correction data.
% 
  uf(1:2:2*nc-1,1) = uf(1:2:2*nc-1,1) + uc(1:nc,1);
  uf(2:2:2*nc-2,1) = uf(2:2:2*nc-2,1) + 0.5 * ( uc(1:nc-1,1) + uc(2:nc,1) );

  return
end
