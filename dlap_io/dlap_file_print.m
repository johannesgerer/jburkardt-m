function dlap_file_print ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, ...
  soln, title )

%*****************************************************************************80
%
%% DLAP_FILE_PRINT prints a DLAP linear system that was stored in a file.
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
%    Input, integer NELT, the number of non-zeros stored in A.
%
%    Input, integer ISYM, a flag to indicate symmetric 
%    storage format.
%    * 0, all nonzero entries of the matrix are stored.
%    * 1, the matrix is symmetric, and only the lower triangle of the
%    matrix is stored.
%
%    Input, integer IRHS, is 1 if a right hand side vector 
%    is included.
%
%    Input, integer ISOLN, is 1 if a solution vector is included.
%
%    Input, integer IA(NELT), integer JA(NELT),
%    real A(NELT), the DLAP triad matrix description.
%
%    Input, real RHS(N), the right hand side vector.
%
%    Input, real SOLN(N), the solution to the linear system.
%
%    Input, string TITLE, a title to be printed.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  dlap_header_print ( n, nelt, isym, irhs, isoln );
%
%  Write out the matrix.
%
  r8sp_print ( n, n, nelt, isym, ia, ja, a, '  The sparse matrix' );
%
%  Write the right hand side.
%
  if ( irhs == 1 )
    dlap_rhs_print ( n, rhs );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No right hand side vector was supplied.\n' );
  end
%
%  Write the solution.
%
  if ( isoln == 1 ) 
    dlap_soln_print ( n, soln );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No solution vector was supplied.\n' );
  end

  return
end