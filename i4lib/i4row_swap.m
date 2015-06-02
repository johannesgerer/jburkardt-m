function a = i4row_swap ( m, n, a, irow1, irow2 )

%*****************************************************************************80
%
%% I4ROW_SWAP swaps two rows of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an array of data.
%
%    Input, integer IROW1, IROW2, the two rows to swap.
%
%    Output, integer A(M,N), the array of data, with two rows swapped.
%

%
%  Check.
%
  if ( irow1 < 1 || m < irow1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_SWAP - Fatal error!\n' );
    fprintf ( 1, '  IROW1 is out of range.\n' );
    error ( 'I4ROW_SWAP - Fatal error!' );
  end

  if ( irow2 < 1 || m < irow2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_SWAP - Fatal error!\n' );
    fprintf ( 1, '  IROW2 is out of range.\n' );
    error ( 'I4ROW_SWAP - Fatal error!' );
  end

  if ( irow1 == irow2 )
    return
  end

  row(1:n) = a(irow1,1:n);
  a(irow1,1:n) = a(irow2,1:n);
  a(irow2,1:n) = row(1:n);

  return
end
