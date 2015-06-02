function dlap_file_write ( n, nelt, isym, irhs, isoln, ia, ja, a, rhs, ...
  soln, iunit )

%*****************************************************************************80
%
%% DLAP_FILE_WRITE writes out DLAP Triad Format Linear System.
%
%  Discussion:
%
%    This routine writes out a DLAP Triad Format Linear System.
%    including the matrix, right hand side, and solution to the
%    system, if known.
%
%    The format for the output is as follows.  On  the first line
%    are counters and flags:
%
%      N, NELT, ISYM, IRHS, ISOLN.
%
%    N, NELT and ISYM are described below.  IRHS is a flag indicating if
%    the RHS was written out (1 is  yes, 0 is  no).  ISOLN  is a
%    flag indicating if the SOLN was written out  (1 is yes, 0 is
%    no).  The format for the first line is: 5i10.  Then comes the
%    NELT Triad's IA(I), JA(I) and A(I), I = 1, NELT.  The format
%    for  these lines is   :  1X,I5,1X,I5,1X,E16.7.   Then comes
%    RHS(I), I = 1, N, if IRHS = 1.  Then comes SOLN(I), I  = 1,
%    N, if ISOLN = 1.  The format for these lines is: 1X,E16.7.
%
%    This routine requires that the  matrix A be stored in the
%    DLAP Triad format.  In this format only the non-zeros  are
%    stored.  They may appear in ANY order.  The user supplies
%    three arrays of length NELT, where NELT is the number of
%    non-zeros in the matrix: (IA(NELT), JA(NELT), A(NELT)).  For
%    each non-zero the user puts the row and column index of that
%    matrix element in the IA and JA arrays.  The value of the
%    non-zero matrix element is placed in the corresponding
%    location of the A array.   This is an extremely easy data
%    structure to generate.  On the other hand it is not too
%    efficient on vector computers for the iterative solution of
%    linear systems.  Hence,  DLAP changes this input data
%    structure to the DLAP Column format for the iteration (but
%    does not change it back).
%
%    Here is an example of the DLAP Triad storage format for a
%    5x5 Matrix.  Recall that the entries may appear in any order.
%
%        5x5 Matrix       DLAP Triad format for 5x5 matrix on left.
%                              1  2  3  4  5  6  7  8  9 10 11
%    |11 12  0  0 15|   A: 51 12 11 33 15 53 55 22 35 44 21
%    |21 22  0  0  0|  IA:  5  1  1  3  1  5  5  2  3  4  2
%    | 0  0 33  0 35|  JA:  1  2  1  3  5  3  5  2  5  4  1
%    | 0  0  0 44  0|
%    |51  0 53  0 55|
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
%    Input, integer IA(NELT), integer JA(NELT),
%    real A(NELT), the DLAP triad matrix description.
%
%    Input, real RHS(N), the right hand side vector.  This array is
%    accessed if JOB is set to print it out.
%
%    Input, real SOLN(N), the solution to the linear system, 
%    if known.  This array is accessed if and only if JOB is set to print it.
%
%    Input, integer IUNIT, the device to which
%    the matrix information is to be written.
%
  dlap_header_write ( iunit, n, nelt, isym, irhs, isoln );
%
%  Write the matrix non-zeros in Triad format.
%
  for i = 1 : nelt
    fprintf ( iunit, ' %d  %d  %g\n', ia(i), ja(i), a(i) );
  end
%
%  Write the right hand side.
%
  if ( irhs == 1 )
    dlap_rhs_write ( iunit, n, rhs );
  end
%
%  Write the solution.
%
  if ( isoln == 1 )
    dlap_soln_write ( iunit, n, soln );
  end

  return
end