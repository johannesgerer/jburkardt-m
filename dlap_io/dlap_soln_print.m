function dlap_soln_print ( n, soln )

%*****************************************************************************80
%
%% DLAP_SOLN_PRINT prints the solution vector from a DLAP file.
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
%    Input, integer N, the order of the matrix.
%
%    Input, real SOLN(N), the solution vector to be written.
%
  r8vec_print ( n, soln, '  DLAP solution vector:' );

  return
end