function a = r8row_swap ( m, n, a, irow1, irow2 )

%*****************************************************************************80
%
%% R8ROW_SWAP swaps two rows of an R8ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the R8ROW.
%
%    Input, integer IROW1, IROW2, the two rows to swap.
%
%    Output, real A(M,N), the array after row swapping.
%
  if ( irow1 < 1 | m < irow1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROW_SWAP - Fatal error!\n' );
    fprintf ( 1, '  IROW1 is out of range.\n' );
    error ( 'R8ROW_SWAP - Fatal error!' );
  end

  if ( irow2 < 1 | m < irow2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROW_SWAP - Fatal error!\n' );
    fprintf ( 1, '  IROW2 is out of range.\n' );
    error ( 'R8ROW_SWAP - Fatal error!' );
  end

  if ( irow1 == irow2 )
    return
  end

  row(1:n) = a(irow1,1:n);
  a(irow1,1:n) = a(irow2,1:n);
  a(irow2,1:n) = row(1:n);

  return
end
