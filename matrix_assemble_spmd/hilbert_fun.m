function a = hilbert_fun ( m, n )

%*****************************************************************************80
%
%% HILBERT_FUN assembles a copy of the Hilbert matrix using SPMD workers.
%
%  Discussion:
%
%    The matrix is assembled in blocks.  Each SPMD worker builds one
%    block, and the client worker assembles the pieces into a single
%    array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix
%    to be generated.
%
%    Output, real A(M,N), the Hilbert matrix.
%
  spmd
    ilo = 1;
    ihi = m;
    jlo = floor ( ( ( labindex ( ) - 1 ) * n ) / numlabs ( ) ) + 1;
    jhi = floor ( (   labindex ( )       * n ) / numlabs ( ) );
    a_block = hilbert_block ( ilo, jlo, ihi, jhi );
  end
%
%  The client collects the stripes into a single matrix.
%
  a = [ a_block{:} ];

  return
end
function a = hilbert_block ( ilo, jlo, ihi, jhi )

%*****************************************************************************80
%
%% HILBERT_BLOCK returns a block of the Hilbert matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ILO, JLO, IHI, JHI, the row and column of the first
%    and last entries in the block.
%
%    Output, real A(1:IHI+1-ILO,1:JHI+1-JLO), the block of the Hilbert matrix.
%
  a = zeros ( ihi + 1 - ilo, jhi + 1 - jlo );

  i = ilo:ihi;

  for j = jlo : jhi
    a(i+1-ilo,j+1-jlo) = i / j;
  end

  return
end
