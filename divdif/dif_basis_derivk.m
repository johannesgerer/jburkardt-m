function [ xdp, ddp ] = dif_basis_derivk ( nd, xd, k )

%*****************************************************************************80
%
%% DIF_BASIS_DERIVK: Lagrange basis K-th derivative difference tables.
%
%  Discussion:
%
%    Given ND points XD, a Lagrange basis polynomial L(J)(X) is associated
%    with each point XD(J).
%
%    This function computes a table DDP(*,*) whose J-th column contains
%    the difference table for the K-th derivative of L(J)(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl deBoor,
%    A Practical Guide to Splines,
%    Springer, 2001,
%    ISBN: 0387953663,
%    LC: QA1.A647.v27.
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND), the X values upon which the 
%    Lagrange basis polynomials are to be based.
%
%    Input, integer K, the index of the derivative.
%
%    Output, real XDP(ND-K), the X values upon with
%    the derivative difference table is based.  In fact, these are
%    all 0.
%
%    Output, real DDP(ND-K,ND), the divided difference 
%    tables for all the Lagrange basis polynomials.  Column J of DDP
%    contains the table for basis polynomial associated with XD(J).
%
  ddp = zeros ( nd - k, nd );
%
%  Process the vectors one column at a time.
%
  for j = 1 : nd
%
%  Set the data.
%
    yd(1:nd,1) = 0.0;
    yd(j,1) = 1.0;
%
%  Compute the divided difference table.
%
    dd = data_to_dif ( nd, xd, yd );
%
%  Compute the divided difference table for the derivative.
%
    [ xdp, ddp(1:nd-k,j) ] = dif_derivk_table ( nd, xd, dd, k );

  end

  return
end
