function dlap_rhs_print ( n, rhs )

%*****************************************************************************80
%
%% DLAP_RHS_PRINT prints the right hand side vector from a DLAP file.
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
%    Input, real RHS(N), the right hand side vector to be written.
%
   r8vec_print ( n, rhs, '  DLAP right hand side vector:' );

  return
end