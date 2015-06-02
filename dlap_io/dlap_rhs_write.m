function dlap_rhs_write ( iunit, n, rhs )

%*****************************************************************************80
%
%% DLAP_RHS_WRITE writes a right hand side vector to a DLAP file.
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
%    Input, real RHS(N), the right hand side vector to be written.
%
  fprintf ( iunit, ' %16.7e\n', rhs(1:n) );

  return
end
