function dlap_header_write ( iunit, n, nelt, isym, irhs, isoln )

%*****************************************************************************80
%
%% DLAP_HEADER_WRITE writes the header line to a DLAP file.
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
%    Input, integer IUNIT, the device to which
%    the matrix information is to be written.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer NELT, the number of non-zeros stored in A.
%
%    Input, integer ISYM, indicates symmetric storage format.
%    * 0, all nonzero entries of the matrix are stored.
%    * 1, the matrix is symmetric, and only the lower triangle of
%      the matrix is stored.
%
%    Input, integer IRHS, is 1 if a right hand side is included.
%
%    Input, integer ISOLN, is 1 if a solution vector is included.
%
  fprintf ( iunit, '%10d%10d%10d%10d%10d\n', n, nelt, isym, irhs, isoln );

  return
end