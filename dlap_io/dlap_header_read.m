function [ n, nelt, isym, irhs, isoln, ios ] = dlap_header_read ( iunit )

%*****************************************************************************80
%
%% DLAP_HEADER_READ reads the header line from a DLAP file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Seager,
%    A SLAP for the Masses,
%    Lawrence Livermore National Laboratory,
%    Technical Report UCRL-100267, December 1988.
%
%  Parameters:
%
%    Input, integer IUNIT, the I/O device to be read.
%
%    Output, integer N, the order of the matrix.
%
%    Output, integer NELT, the number of non-zeros stored in A.
%
%    Output, integer ISYM, indicates symmetric storage format.
%    * 0, all nonzero entries of the matrix are stored.
%    * 1, the matrix is symmetric, and only the lower triangle of
%      the matrix is stored.
%
%    Output, integer IRHS, is 1 if a right hand side vector
%    is included.
%
%    Output, integer ISOLN, is 1 if a solution vector is included.
%
%    Output, integer IOS, the I/O status variable, which is 0 if
%    no I/O error occurred.
%
  ios = 0;
  line = fgets ( iunit );

  if ( line == -1 )
    ios = 1;
    return
  end

  [ x, count ] = sscanf ( line, '%d%d%d%d%d' );

  if ( count ~= 5 )
    ios = 2;
    return
  end

  n = x(1);
  nelt = x(2);
  isym = x(3);
  irhs = x(4);
  isoln = x(5);

  return
end
