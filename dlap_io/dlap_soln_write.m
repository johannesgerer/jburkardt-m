function dlap_soln_write ( iunit, n, soln )

%*****************************************************************************80
%
%% DLAP_SOLN_WRITE writes a solution vector to a DLAP file.
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
%    Input, integer IUNIT, the output device to which
%    the matrix information is to be written.
%
%    Input, integer N, the order of the matrix.
%
%    Input, real SOLN(N), the solution vector to be written.
%
  fprintf ( iunit, '  %g\n', soln(1:n) );

  return
end