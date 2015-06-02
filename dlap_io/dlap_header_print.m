function dlap_header_print ( n, nelt, isym, irhs, isoln )

%*****************************************************************************80
%
%% DLAP_HEADER_PRINT prints the header line of a DLAP file.
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
%    Input, integer ISYM, indicates symmetric storage format.
%    * 0, all nonzero entries of the matrix are stored.
%    * 1, the matrix is symmetric, and only the lower triangle of
%      the matrix is stored.
%
%    Input, integer IRHS, is 1 if a right hand side vector 
%    is included.
%
%    Input, integer ISOLN, is 1 if a solution vector is included.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DLAP Sparse Matrix File Header:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N,     the matrix order =                %d\n', n );
  fprintf ( 1, '  NELT,  the number of nonzeros stored =   %d\n', nelt );
  fprintf ( 1, '  ISYM,  1 if symmetric storage used =     %d\n', isym );
  fprintf ( 1, '  IRHS,  1 if a right hand side included = %d\n', irhs );
  fprintf ( 1, '  ISOLN, 1 if a solution vector included = %d\n', isoln );

  return
end